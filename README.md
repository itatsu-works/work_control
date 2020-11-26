# アプリケーション名
Work Control

# アプリケーション概要
グループの仕事を管理し、お互いの仕事状況を共有することを目的としたアプリケーション

# URL
https://work-control.herokuapp.com
# テスト用アカウント
Name:test<br>
E-mail:test@gmial.com<br>

# 利用方法
### ユーザー登録・ログアウト
1. URLからTOPページへアクセスします。
    1. アカウントを持っている場合<br>
  メールアドレスとパスワードを入力しログインします。
    1. アカウントを持っていない場合<br>
  登録画面へ遷移するリングがありますので、そちらから新規登録を行います。
1. ログアウトは画面右上の"ログアウト"をクリックすることで行えます。
---
### グループ作成
1. 画面上部の"グループを作成する"をクリックするとグループ作成画面へ遷移します。
1. グループ名欄に作成するグループの名前を入力します。
1. グループに参加させたいユーザを選択します。
1. "Crate Group"を押すとグループが作成されます。
---
### グループ解散
1. サイドバーから解散したいグループを選択します。
1. "グループを解散する"ボタンをクリックします。
### 仕事の登録
1. サイドバーから仕事を登録したいグループを選択します。
1. "仕事を登録する"ボタンをクリックすると、仕事登録画面へと遷移します。
1. 仕事名、期限(仕事の登録日よりも後の日付を入力してください)、詳細を入力します。
1. "Create Work"をクリックし、画面がTOPページへ遷移されたら完了です。
---
### 仕事情報の変更
1. 変更したい仕事があるグループ画面へアクセスします。
1. 変更したい仕事の横にある"編集"ボタンを押すと編集画面へと画面が遷移します。
1. 仕事情報を変更します。
1. "Update Work"ボタンをクリックすると、TOPページへ遷移し、仕事情報が更新されます。
---
### 仕事の削除
1. 削除したい仕事があるグループ画面へアクセスします。
1. 削除したい仕事の横にある"削除"ボタンを押すと仕事が削除されます。
---
# 目指した課題解決
- リーダーが部下の仕事の内容・進捗を管理すること
- 作業者が各々の仕事を把握すること
- 作業者が業務の報告を容易に行えるようにすること

# 洗い出した要件
### ユーザー管理機能
**目的** <br>
本人または決められたユーザーだけが仕事の管理ができるようにする。

---
### グループ管理機能
**目的** <br>
グループ(プロジェクト)ごとに仕事を扱うことによって、仕事情報の機密性・管理性を高める。

---
### 仕事管理機能
**目的** <br>
ユーザーが仕事情報を管理(作成・編集・削除)を行えるようにし、利便性を向上させる。

---
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
  - 詳細画面にて仕事内容の詳細を確認できるようにする。
- グループに関する機能
  - メンバー編集(追加・削除)機能

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
