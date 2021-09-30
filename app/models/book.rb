class Book < ApplicationRecord
  has_many :book_reads, dependent: :destroy
  has_many :book_unreads, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates  :isbn, presence: true

  acts_as_taggable

  # Bookモデルに登録するハッシュ
  def self.book_details(book)
    {
      "title" => book.title,
      "isbn" => book.isbn,
      "author" => book.author,
      "publisher_name" => book.publisher_name,
      "image_url" => book.large_image_url.chomp("?_ex=200x200"),
      "sales_date" => book.sales_date.gsub(/年|月|日|頃/, ""),
      "url" => book.item_url,
    }
  end

  # 読んだ本が既にテーブルに存在するか？
  def read_present?(user, type)
    if type == "read"
      book_reads.where(user_id: user.id).present?
    else
      book_unreads.where(user_id: user.id).present?
    end
  end

  # 楽天ブックスのジャンルID（カテゴリ）
  enum genre_id:
    { 少年: "001001001",
      少女: "001001002",
      青年: "001001003",
      レディース: "001001004",
      文庫: "001001006",
      その他: "001001012",
    }

  #  本を検索する
  def self.search_books(keyword:"本", author:"", sort:"standard", genre:"",hits: 28)
    RakutenWebService::Books::Total.search(
      keyword: keyword,
      author: author,
      sort: sort,
      booksGenreId:"001001" + genre,
      orFlag: "1",
      NGKeyword: "BL Jパブリッシング シュークリーム 祥伝社 英和出版社 メディアソフト",
      hits: hits
      )
  end

  # 読んだ順
  def self.reads_rank(model)
    #book_idを件数順にソート後、ハッシュキーのみ取り出す
    model.all.group(:book_id).count(:book_id).sort_by{|_, v| v}.reverse.to_h.keys
  end

  # レビュー平均
  def self.reviews_avg(book)
    book.book_reads.sum(:rate).to_f / book.book_reads.count
  end

end
