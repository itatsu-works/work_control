# アプリケーショん名

# アプリケーション概要

# URL

# テスト用アカウント

# 利用方法

# 目指した課題解決


# 洗い出した要件

# 実装した機能について

# 実装予定の機能

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
