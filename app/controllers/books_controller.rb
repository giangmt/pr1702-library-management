class BooksController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def index
    @books = Book.search(params[:search]).paginate page: params[:page], per_page: Settings.books.page
  end

  def show
    @book = Book.find_by id: params[:id]
    redirect_to root_url if @book.nil?
  end

  private

  def book_params
    params.require(:book).permit :content
  end
end
