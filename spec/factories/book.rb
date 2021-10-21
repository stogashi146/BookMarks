FactoryBot.define do
  factory :book do
    title { "鬼滅の刃 23" }
    isbn { 9784088824956 }
    author { "吾峠 呼世晴" }
    publisher_name { "集英社" }
    sales_date { "2020-11-04" }
    image_url { "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/4956/9784088824956.jpg" }
    url { "https://books.rakuten.co.jp/rb/16502436/" }
  end
end
