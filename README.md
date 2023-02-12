# README

# アプリケーション名
team-app

# アプリケーション概要
チームの管理アプリ。練習日や参加者、練習内容などを共有できる。チャットでコミュニケーションもできる。

# URL


# テスト用アカウント
・Basic認証パスワード：user
・Basic認証ID：0000
・メールアドレス：user1@mail.com
・パスワード:user1
・
# 利用方法
#　練習日新規投稿
カレンダーから練習日を記入したい日程をクリックすると投稿ページへ。各項目を記入して完了でカレンダーに表示
#　練習日の編集
カレンダーに表示されているタイトルをクリックで編集ページへとび編集できる

# アプリケーションを作成した背景
私は現在サッカーチームでコーチをしており、そこで同じようなチーム管理アプリを使っているが、汎用的なもので余計な機能が多く使いづらい。そこで、普段使用する機能のみのにした、より使いやすいものを自作したい。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1fKUvOnCOvCILf-R0Jszedvkao_FnK2A51ukQpzSHM2k/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明


# 実装予定の機能


# データベース設計
![](ER%E5%9B%B3.png)

# 画面遷移図
![](%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3.png)

# 開発環境
・Ruby
・Ruby on Rails
・MySQL
・Github
・Visual Studio Code

# ローカルでの動作方法


# 工夫したポイント


[def]: ../../Downloads/ER%E5%9B%B3.png



## users テーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

##Association
- has_many :schedules
- has_many :comments
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages


## schedule テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| start_time | datetime   | null: false                    |
| title      | string     | null: false                    |
| place      | string     |                                |
| person     | string     |                                |
| practice   | string     |                                |
| others     | string     |                                |
| user       | references | null: false, foreign_key: true |

##Association
- belongs_to :user
- has_many :comments

## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| schedule   | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |

##Association
- belongs_to :user
- belongs_to :schedule

## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user