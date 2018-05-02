class Admin::BorrowsController < ApplicationController
  before_action :logged_in_user, :verify_admin
  before_action :load_borrow, only: :update

  def index
    @borrows = Borrow.load_by_order.paginate page: params[:page],
      per_page: Settings.borrows.page
  end

  def update
    if params[:borrow][:status].present?
      @borrow.update_attributes status: params[:borrow][:status]
      flash[:success] = t ".update_success"
      redirect_to admin_borrows_path
    end
  end

  private

  def borrow_params
    params.require(:borrow).permit :date, :book_id, :user_id
  end

  def status_params
    params.require(:borrow).permit :status
  end

  def load_borrow
    @borrow = Borrow.find_by id: params[:id]
    redirect_to root_url if @borrow.nil?
  end
end
