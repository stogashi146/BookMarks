# BookMarks
#### BookMarksはどこでも漫画の表紙買いができるWebサービスです！
![bookmarks_(1)](https://user-images.githubusercontent.com/83628316/131446594-8d372348-88eb-4eb3-9fa7-7f8db1f3b362.png)

https://book-marks.net/

```
【ログイン方法】
・　メールアドレス
  メールアドレスでログインできます
  
・　ゲストユーザー
  すぐにログインいただけます
  
・　twitter
  twitterアカウントでログインできます
  
※未ログインでも本の閲覧は可能です
```

## サイト概要
書店のような感覚で「表紙買い」できるサイトです。

- 漫画の表紙を一覧で見ることができるので、表紙買いが捗る
- コロナで書店に行けなくても、WEBで書店のような感覚で表紙を眺めることができる
- フォロー、コメント、タイムライン機能で好きな人同時で繋がり、さらに新しい本との出会いが生まれる
- 発売前の漫画は前日にメールでお知らせ

### サイトテーマ
どこでも漫画の表紙買いができるサイト

### テーマを選んだ理由
新しい漫画を購入しようとする際、
通販サイト等で漫画カテゴリを確認するが、
そこに表示される漫画は、売上げランキング上位の人気作ばかりである。
インターネットで新しい漫画を開拓しようと思った際に、
どう探してよいか分からないというのが現状。

実際に書店に足を運び、陳列されている漫画を眺めて、
目に止まった商品を買う・・・いわゆる「表紙買い」を、
インターネットでも体験してもらいたいと思ったことが理由の一つ。

また、新型コロナウイルスの流行により、
実際に書店に行けない状態が進んでいる。
その中でも、実際の書店のような感覚で、
漫画を選んでほしいと思ったのも理由の一つ。

### ターゲットユーザ
- インターネットでも表紙買いをしたい人
- コロナの影響で書店に行けない人
- 漫画好きな人同士で繋がりたい人
- 新発売の漫画を買い逃したくたい人

### 主な利用シーン
- 新たな漫画を開拓したいとき
- インターネットで表紙買いをしたいとき
- 表紙買いする前に評価を確認したいとき
- 漫画好きな人同士で繋がりたいとき
- 発売前の漫画を買い逃したくないとき

## 設計書
ER図
![ER](https://user-images.githubusercontent.com/83628316/131244452-2068c80f-e27f-435d-8e8a-4ed39640f499.jpg)

[テーブル定義書](https://drive.google.com/file/d/1sBXaajitwdSyAf7eLtXdoQqGRA3nndCc/view?usp=sharing)

[アプリケーション詳細設計](https://drive.google.com/file/d/1MqvGTELWrHOM01Cm26Ob-kuItxCAriNm/view?usp=sharing)

## 機能一覧
| 機能 | 未ログイン | ログイン済 |
|:---|:---:|:---:|
|会員登録 |○ |× |
|ログイン |○ |× |
|ログアウト |× |○ |
|退会 |× |○ |
|メール認証 |○ |○<br>(メールアドレス変更時) |
|認証メール再送 |○ |○ |
|パスワード変更 |× |△<br>（oauth、ゲストは不可） |
|パスワード忘れた場合 |○ |△<br>（oauth、ゲストは不可） |
|プロフィール編集 |× |△<br>（oauth、ゲストには制限あり） |
|本一覧 |○ |○ |
|本検索 |○ |○ |
|ランキング |○ |○ |
|レビュー投稿 |× |○ |
|読みたいに追加 |× |○ |
|レビューコメント|× |○ |
|レビューいいね|× |○ |
|フォロー |× |○ |
|タイムライン |× |○ |
|通知 |× |○ |
|発売カレンダー |× |○ |
|発売前日メール通知 |× |○ |

### その他使用技術
- SMTPサーバー(Amazon SES)
- メール自動送信（クーロン）
- レスポンシブ（Bootstrap)

### 使用ライブラリ
- devise（ユーザー認証）
- refile（画像投稿）
- Slim(テンプレートエンジン)
- html2slim（htmlをslim化）
- dotenv-rails（環境変数化）
- pry-byebug, pry-rails, better_errors, binding_of_caller（デバッグ）
- rakuten_web_service（楽天API）
- kaminari（ページネーション）
- acts-as-taggable-on（タグ付け）
- simple_calendar（カレンダー）
- whenever（メール自動送信）
- omniauth、omniauth-twitter（oauthログイン）
- raty.js　（レビューの星評価）
- slick（画像のスクロール）

## チャレンジ要素一覧
<https://docs.google.com/spreadsheets/d/1UM0VgJU5HbOTElV1Mduhrn2uDL6FJvv3MqAvTWxFVYc/edit?usp=sharing>

## 今後追加したい機能
- BulletによるN+1問題解消
- GitHubActionによる、自動デプロイ・テスト
- セキュリティ対策
- お問い合わせ機能
- タグからの検索
- リストのソート機能

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9
- [楽天ブックス総合検索API](https://webservice.rakuten.co.jp/)

## 使用素材
【ワイヤフレーム】
- [Adobe XD](https://www.adobe.com/jp/products/xd.html)

【サイトロゴ】
- [Adobe Spark](https://spark.adobe.com/ja-JP/sp)

【ファビコン】
- [Canva](https://www.canva.com/ja_jp/)
- [alphaicon](https://ao-system.net/alphaicon/)

【配色】
- [hue360](http://hue360.herokuapp.com/)

【サイトアイコン】
- [FontAwesome](https://fontawesome.com/)

【ドメイン取得】
- [お名前.com](https://www.onamae.com/)
