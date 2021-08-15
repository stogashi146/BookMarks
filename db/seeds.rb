# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(email:"user1@mail.com",password:"password",name:"ユーザー1",name_id:"user1")
User.create!(email:"user2@mail.com",password:"password",name:"ユーザー2",name_id:"user2")
User.create!(email:"user3@mail.com",password:"password",name:"ユーザー3",name_id:"user3")

Book.create!(
  title: "古見さんは、コミュ症です。（21）",
  isbn: "9784098505296",
  author: "オダ トモヒト",
  publisher_name: "小学館",
  sales_date: "2021年05月18日",
  image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/5296/9784098505296.jpg",
  url: "https://books.rakuten.co.jp/rb/16694975/")
Book.create!(
  title: "かぐや様は告らせたい 22 〜天才たちの恋愛頭脳戦〜",
  isbn: "9784088918709",
  author: "赤坂 アカ",
  publisher_name: "集英社",
  sales_date: "2021年05月19日",
  image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/8709/9784088918709_1_2.jpg",
  url: "https://books.rakuten.co.jp/rb/16694910/")
Book.create!(
  title: "マウントセレブ金田さん 1",
  isbn: "9784253292412",
  author: "ニャロメロン",
  publisher_name: "秋田書店",
  sales_date: "2021年08月06日",
  image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/2412/9784253292412_1_2.jpg",
  url: "https://books.rakuten.co.jp/rb/16762961/")

BookRead.create!(
  user_id: 1,
  book_id: 1,
  rate: 4,
  comment: "どの子たちも個性豊かで愛おしいです。今回も楽しく読ませて頂きました。そしてついにアニメ化するそうです！！",
  is_shared: nil
  )
BookRead.create!(
  user_id: 1,
  book_id: 2,
  rate: 5,
  comment: "ストーリーが本当に面白いし、キャラクターもとても魅力的。この巻は破壊力がすごいです。尊すぎます。何度も読み返してしまいます。早坂がとてもかわいい回です。あ
と白銀のお父さんもすき。続きが気になります。白銀かっこいいなあ。",
  is_shared: nil
  )
BookRead.create!(
  user_id: 1,
  book_id: 3,
  rate: 4,
  comment: "とにかく尊いし、癒されます。西方と高木さんの子どものころのお話が描かれていて、とても良かったです。西方のやさしさや高木さんの優しさにキュンキュンします。本
当に温かい世界観です。続きもとても楽しみにしています。",
  is_shared: nil
  )
BookRead.create!(
  user_id: 2,
  book_id: 1,
  rate: 5,
  comment: "会話の一つ一つがなんともいえず、登場人物の優しさや個性がしみて癖になります。",
  is_shared: nil
  )
BookRead.create!(
  user_id: 2,
  book_id: 2,
  rate: 3,
  comment: "キャラの魅力が本当にすばらしいと思う。ずっと読んでいると実在の人物かのように思えてきて親しみがわく。ワクワクする展開も素晴らしい",
  is_shared: nil
  )
BookRead.create!(
  user_id: 2,
  book_id: 3,
  rate: 5,
  comment: "アニメ化おめでとうございます！！\r\nキャラクター達がどんな動きをするのが楽しみです^^",
  is_shared: nil
  )
 BookUnread.create!(book_id: 1, user_id: 1)
 BookUnread.create!(book_id: 1, user_id: 1)
 BookUnread.create!(book_id: 1, user_id: 1)
 BookUnread.create!(book_id: 2, user_id: 2)
 BookUnread.create!(book_id: 2, user_id: 2)
 BookUnread.create!(book_id: 2, user_id: 2)
 BookUnread.create!(book_id: 3, user_id: 3)
 BookUnread.create!(book_id: 3, user_id: 3)
 BookUnread.create!(book_id: 3, user_id: 3)