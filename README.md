# アプリケーション名
Work Control

# アプリケーション概要
グループの仕事を管理することを目的としたアプリケーション

# URL

# テスト用アカウント

# 利用方法

# 目指した課題解決
- リーダーが部下の仕事の内容・進捗を管理すること
- 作業者が各々の仕事を把握すること
- 作業者が業務の報告を容易に行えるようにすること

# 洗い出した要件

# 実装した機能について
- 仕事に関する機能
  - 仕事登録機能
  - 仕事編集機能
  - 仕事削除機能
- グループに関する機能
  - グループ作成機能
  - グループ削除機能

# 実装予定の機能
- 仕事に関する機能
  - 仕事の進捗状況を入力できるようにし、グループの人が確認できるようにする。
- グループに関する機能
  - 現状、グループが2人(グループ作成者と招待された人)しか参加できないので、3人以上の登録ができるようにする。

# ローカルでの動作方法

# テーブル設計

## Usersテーブル

|   Column    |   Type    |   Options   |
|-------------|-----------|-------------|
|name         |string     |null:  false |
|mail         |string     |null:  false |
|password     |string     |null:  false |

### Association
- has_many  :groups,  through :user_groups
- has_many  :works, through:  :user_works

## Groupsテーブル

|   Column    |   Type    |               Options             |
|-------------|-----------|-----------------------------------|
|user_id      |integer    |null:  false, foreign_key: true    |
|group_name   |string     |null:  false                       |

### Association
- has_many  :users, through:  :user_groups
- has_many  :works

## User_Groupsテーブル

|   Column    |   Type    |               Options             |
|-------------|-----------|-----------------------------------|
|group_id     |references |null:  false,  foreign_key:  true  |
|user_id      |references |null:  false,  foreign_key:  true  |

### Association
- belongs_to  :users
- belongs_to  :groups

## Worksテーブル

|   Column    |   Type    |               Options             |
|-------------|-----------|-----------------------------------|
|work_name    |string     |null:  false                       |
|deadline     |time       |null:  false                       |
|contents     |text       |null:  false                       |
|group_id     |references |null:  false,  foreign_key:  true  |

### Association
- belongs_to  :groups
- has_one :progresses
- has_many  :user, through:  :user_works

## Progressesテーブル

|   Column    |   Type    |               Options             |
|-------------|-----------|-----------------------------------|
|work_id      |references |null:  false,  foreign_key:  true  |
|work_progress|string     |                                   |

### Association
- belongs_to  :works

### User_worksテーブル

|     Column    |   Type    |               Oprions             |
|---------------|-----------|-----------------------------------|
|user_id        |references |null:  false,  foreign_key:  true  |
|work_id        |references |null:  false,  foreign_key:  true  |

### Association
- belongs_to  :users
- belongs_to  :works
