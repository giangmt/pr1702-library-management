class RequestBorrowController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @borrow = Borrow.new
  end

  def create
    @borrow = current_user.borrows.build borrow_params
    if @borrow.save
      flash[:success] = t ".borrow"
      redirect_to root_url
    else
      render :new
    end
  end

  private
  def borrow_params
    params.require(:borrow).permit :date
  end
end
