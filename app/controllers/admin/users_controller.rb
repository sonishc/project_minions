class Admin::UsersController < ApplicationController
  layout 'dashboard'
  before_action :authorize

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end
end
