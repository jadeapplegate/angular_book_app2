class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]
  respond_to :json

  def index
    respond_with Book.all
  end

  def show
    respond_with @book
  end

  def update
    respond_with @book.update(book_params)
  end

  def destroy
    respond_with @book.destroy
  end

  private
    def set_book
      @book = Book.find(book_params)
    end

    def book_params
      params.require(:book).permit(:title, :author, :isbn, :description)
    end

end
