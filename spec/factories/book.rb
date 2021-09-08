FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    isbn { Faker::Lorem.characters(number: 20) }
    author { Faker::Book.author }
    publisher_name { Faker::Book.publisher }
    sales_date { Time.current.to_date }
    image_url { Faker::Internet.url }
    url { Faker::Internet.url }
  end
end