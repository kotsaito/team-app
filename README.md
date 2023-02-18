# README

# アプリケーション名
team-app

# アプリケーション概要
チームの管理アプリ。練習日や参加者、練習内容などを共有できる。チャットでコミュニケーションもできる。

# URL
https://team-app-38239.onrender.com/

# テスト用アカウント
・Basic認証パスワード：0000
・Basic認証ID：user
 user1
・メールアドレス：user1@mail.com
・パスワード:user1111

user2
・メールアドレス：user2@mail.com
・パスワード:user2222

# 利用方法
#　練習予定投稿機能
1.トップページの新規予定作成ボタンをクリックして投稿ページへ
2.項目を記載(件名のみ必須)してCreateScheduleボタンクリックで投稿
3.トップページの直近の予定の詳細ボタンかカレンダー上に表示される件名をクリックで詳細ページジェ
4.予定を作成したユーザーは詳細ページ下部のボタンから編集と削除が可能
5.全てのユーザーが詳細ページより、その予定に対しコメントを打つことができる
#　コミュニケーション機能
1.トップページ下部の吹き出しマークをクリックしてチャットページへ
2.チャットページ左上付近のチャットを作成するをクリックでチャット作成ページへ
3.チャット作成ページでチャットルーム名を入力、チャットしたい相手のユーザー名を選択
4.チャットページ左に先ほど作成したチャットルーム名が記載されているのでクリック
5.チャットページ中央下部にメッセージ欄が表示されるので、入力して送信すると中央のチャット欄に表示される
6.メッセージ欄右の画像をクリックすると、ファイルが開く。
拡張子が「.png」または「.jpeg」の画像を選択すれば投稿できます。
7.チャットルームを開いた状態で右上のチャットを終了するボタンをクリックしてチャットルーム削除

# アプリケーションを作成した背景
私は現在サッカーチームでコーチをしており、そこで同じようなチーム管理アプリを使っているが、汎用的なもので余計な機能が多く使いづらい。そこで、普段使用する機能のみのにした、より使いやすいものを自作したい。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1fKUvOnCOvCILf-R0Jszedvkao_FnK2A51ukQpzSHM2k/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明
1.ログイン
　[![Image from Gyazo](https://i.gyazo.com/8ba6b785e02fba8669e2f1d679e70a60.gif)](https://gyazo.com/8ba6b785e02fba8669e2f1d679e70a60)

2.新規予定作成
[![Image from Gyazo](https://i.gyazo.com/22e61ba3f5a11aeb32f0442bebd905b2.gif)](https://gyazo.com/22e61ba3f5a11aeb32f0442bebd905b2)

3.予定編集
[![Image from Gyazo](https://i.gyazo.com/d73f3c3cf8830d92d1f97949de79b5af.gif)](https://gyazo.com/d73f3c3cf8830d92d1f97949de79b5af)

4.予定削除
[![Image from Gyazo](https://i.gyazo.com/e9328b01f1c07e07876df1b6a189ccd9.gif)](https://gyazo.com/e9328b01f1c07e07876df1b6a189ccd9)

5.予定へコメント
[![Image from Gyazo](https://i.gyazo.com/850727b172373ba1a7795568b1016564.gif)](https://gyazo.com/850727b172373ba1a7795568b1016564)

5.チャットルーム作成
[![Image from Gyazo](https://i.gyazo.com/919a2d8229a347cabd5e83389475b589.gif)](https://gyazo.com/919a2d8229a347cabd5e83389475b589)

6.チャットメッセージ
[![Image from Gyazo](https://i.gyazo.com/73bfea500b7adca9de1ff80eabbd1dce.gif)](https://gyazo.com/73bfea500b7adca9de1ff80eabbd1dce)

7.チャットルーム削除
　[![Image from Gyazo](https://i.gyazo.com/0188111c6779ecbdfeca83a7fb87f09a.gif)](https://gyazo.com/0188111c6779ecbdfeca83a7fb87f09a)


# 実装予定の機能
チームグループ機能

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
%git clone https://github.com/kotsaito/team-app.git
% cd team-app
%bundle install
%yarn install

# 工夫したポイント
自主制作のため、制作速度は特に制約なかったですが納期意識を持って作成した。
１ヶ月半を目安にしていましたが、アプリ作成はその期間内で作成することができた。

また、カレンダー機能は作成したことはなかったが、新しい知識を習得することもできるので、自分で調べながら作成した。

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