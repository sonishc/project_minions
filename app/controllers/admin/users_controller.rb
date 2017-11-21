class Admin::UsersController < ApplicationController
  layout 'dashboard'
  before_action :authorize

  def index
    new
    @users = User.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      flash.now[:error] = 'Bad data for user :('
      redirect_back(fallback_location: root_path)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :sex, :age, :email, :confirm_token,
                                 :email_confirmed, :password,
                                 :password_confirmation)
  end
end
