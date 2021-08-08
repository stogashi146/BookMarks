class BooksController < ApplicationController

  def index
    @keyword = params[:keyword]
    if @keyword && params[:page].nil?
      @page = 1
      @books = RakutenWebService::Books::Total.search(keyword: @keyword, booksGenreId: "001001", hits: 28).page(1)
    elsif params[:page].present?
      @page = params[:page].to_i
      @books = RakutenWebService::Books::Total.search(keyword: @keyword, booksGenreId: "001001", hits: 28).page(params[:page])
    end



  end

  def show
  end

  def create
  end

  def search

  end
end
