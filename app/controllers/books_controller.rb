class BooksController < ApplicationController

  def index
    @keyword = params[:keyword]
    if @keyword && params[:page].nil?
      @page = 1
      @books = RakutenWebService::Books::Total.search(keyword: @keyword, booksGenreId: "001001001", hits: 28).page(1)
    elsif params[:page].present?
      @page = params[:page].to_i
      @books = RakutenWebService::Books::Total.search(keyword: @keyword, booksGenreId: "001001001", hits: 28).page(params[:page])
    end

    if params[:author]
      @page = 1
      @books = RakutenWebService::Books::Total.search(keyword: params[:author].gsub(" ", "") ,author: params[:author].gsub(" ", ""), booksGenreId: "001001", hits: 28).page(1)
    end

  end

  def show
    @book = Book.find(params[:id])
    @book_read = @book.book_reads.find_by(user_id: current_user.id) if user_signed_in?
    @reviews = @book.book_reads
  end

  def detail
    @details = params[:book]
  end

  def create
    unless Book.where(isbn: params[:book][:isbn]).exists?
      book = Book.create(book_params)
    else
      book = Book.find_by(isbn: params[:book][:isbn])
    end
    redirect_to book_path(book)
  end

  def search
  end

  def review
  end

  private
  def book_params
    params.require(:book).permit(:title, :isbn, :author, :publisher_name, :sales_date, :image_url, :url)
  end

end
