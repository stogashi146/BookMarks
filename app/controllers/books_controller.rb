class BooksController < ApplicationController

  def index
    @keyword = params[:keyword]
    # 普通の検索時
    if @keyword && params[:page].nil?
      @page = 1
      @books = Book.search_books(keyword: @keyword).page(1)
    # 本を探すから検索したとき
    elsif params[:page].present?
      @page = params[:page].to_i
      @books = Book.search_books(keyword: @keyword).page(params[:page])
    end
    # 本詳細から著者で検索したとき
    if params[:author]
      @page = 1
      @books = Book.search_books(keyword: @keyword = params[:author],author: params[:author]).page(1)
    end

  end

  def show
    @book = Book.find(params[:id])
    @book_read_new = BookRead.new
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

  def ranking
    if params[:marks_sort] == "read"
      @books_rank = Book.find(Book.reads_rank(BookRead))
    elsif params[:marks_sort] == "unread"
      @books_rank = Book.find(Book.reads_rank(BookUnread))
    else
      @books_rank = Book.search_books(genre:params[:genre], sort:"sales", hits:"30")
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :isbn, :author, :publisher_name, :sales_date, :image_url, :url)
  end

end
