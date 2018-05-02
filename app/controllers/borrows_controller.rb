class BorrowsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def index
    @borrows = Borrow.load_by_order.paginate page: params[:page],
      per_page: Settings.borrows.page
  end

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

  def destroy
    @borrow = Borrow.find params[:id]
    if @borrow.nil?
      redirect_to books_path
    else
      @borrow.destroy ? flash[:success] = t(".return_success")
        : flash[:danger] = t(".can't_return")
      redirect_to borrows_path
    end
  end

  private

  def borrow_params
    params.require(:borrow).permit :date, :book_id, :user_id
  end
end
