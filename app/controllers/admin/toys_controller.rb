class Admin::ToysController < ApplicationController
  layout 'dashboard'
  before_action :authorize
  before_action :new, :all_users, only: :index

  def index
    @toys = Toy.all.order(:name)
  end

  def new
    @toy = Toy.new
  end

  def create
    @toy = Toy.new(toy_params)
    if @toy.save
      flash[:success] = 'Successful create :)'
      redirect_to admin_toys_path
    else
      flash[:error] = 'Have problems :('
      render 'index'
    end
  end

  def edit
    @toy = Toy.find(params[:id])
  end

  def update
    @toy = Toy.find(params[:id])
    if @toy.update_attributes(toy_params)
      flash[:success] = 'Successful update :)'
      redirect_to admin_toy_path
    else
      render 'edit'
    end
  end

  def show
    @toy = Toy.find(params[:id])
  end

  def destroy
    Toy.find(params[:id]).destroy
    flash[:success] = 'Toy deleted'
    redirect_to admin_toys_path
  end

  private

  def all_users
    @users = User.all
  end

  def toy_params
    params.require(:toy).permit(%i[name user_id])
  end
end
