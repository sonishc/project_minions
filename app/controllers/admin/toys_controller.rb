class Admin::ToysController < ApplicationController
  layout 'dashboard'
  before_action :authorize

  def index
    @toys = Toy.all
  end

  def show
    @toy = Toy.find_by(id: params[:id])
  end
end
