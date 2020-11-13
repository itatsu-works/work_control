# テーブル設計

## Usersテーブル

|   Column    |   Type    |   Options   |
|-------------|-----------|-------------|
|name         |string     |null:  false |
|mail         |string     |null:  false |
|password     |string     |null:  false |

### Association
- has_many  :user_groups

## Groupsテーブル

|   Column    |   Type    |               Options             |
|-------------|-----------|-----------------------------------|
|leader_id    |integer    |null:  false, foreign_key: true    |
|group_name   |string     |null:  false                       |

### Association
- has_many  :user_groups
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

## Progressesテーブル

|   Column    |   Type    |               Options             |
|-------------|-----------|-----------------------------------|
|work_id      |references |null:  false,  foreign_key:  true  |
|work_progress|string     |                                   |

### Association
- belongs_to  :works