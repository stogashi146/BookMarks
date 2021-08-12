class Book < ApplicationRecord
  has_many :book_reads, dependent: :destroy
  has_many :book_unreads, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :book_tags, dependent: :destroy

  validates  :isbn, presence: true

  def self.book_details(book)
    {
      "title" => book.title,
      "isbn" => book.isbn,
      "author" => book.author,
      "publisher_name" => book.publisher_name,
      "image_url" => book.large_image_url.chomp("?_ex=200x200"),
      "sales_date" => book.sales_date,
      "url" => book.item_url,
    }
  end

  # 読んだ本が既にテーブルに存在するか？
  def read_exists?(user, type)
    if type == "read"
      book_reads.where(user_id: user.id).exists?
    else
      book_unreads.where(user_id: user.id).exists?
    end

  end

end