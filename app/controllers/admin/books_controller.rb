class Admin::BooksController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :admin_user, only: [:index, :create, :destroy]
  before_action :load_categories, only: [:index, :new]
  before_action :load_publishers, only: [:index, :new]

  def index
    @books = Book.load_by_order.paginate page: params[:page], per_page: Settings.books.page
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      flash[:success] = t ".book_create"
      redirect_to admin_books_path
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit :name, :image, :page, :category_id,
      :publisher_id, :description, :author_id
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def load_categories
    @categories = Category.all
  end

  def load_publishers
    @publishers = Publisher.all
  end
end
