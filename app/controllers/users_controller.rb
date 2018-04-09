class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]

  def index
    @users = User.select_user.paginate page: params[:page], per_page: Settings.users.page
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    redirect_to root_url if @user.nil?
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t ".success"
      redirect_to @user
    else
      render :new
    end
  end

  def destroy
    User.find params[:id].destroy
    flash[:success] = t ".delete_user"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end
end
