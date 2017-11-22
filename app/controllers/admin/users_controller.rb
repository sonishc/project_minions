class Admin::UsersController < ApplicationController
  layout 'dashboard'
  before_action :authorize
  before_action :find_user, only: %i[show edit]
  before_action :new, only: :index

  def index
    @users = User.all.order('created_at DESC')
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

  def show; end

  def edit; end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :sex, :age, :email, :image,
                                 :confirm_token, :email_confirmed, :password,
                                 :password_confirmation)
  end
end
