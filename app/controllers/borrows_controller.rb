class BorrowsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def new
    @borrow = Borrow.new
  end

  def create
    @borrow = Borrow.new borrow_params
    book = Book.find_by id: params[:borrow][:book_id]
    if book.nil?
      flash[:danger] = t ".book_nil"
      redirect_to root_url
    else
      @borrow.book = book
      @borrow.user = current_user
      @borrow.save
      flash[:success] = t ".request_success"
      redirect_to books_path
    end
  end

  private

  def borrow_params
    params.require(:borrow).permit :date, :book_id, :user_id
  end
end
