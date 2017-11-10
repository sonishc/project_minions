class ToysController < ApplicationController
  def index
    @toys = Toy.where(user_id: current_user.id)
  end

  def show
    index
    @toy = Toy.find_by(id: params[:id])
    return unless params[:state]
    return unless @toy.may_event?(params[:event])
    @toy.send("#{params[:event]}!")
  end

  def new
    @toy = Toy.new
  end

  def create
    @toy = Toy.create(toy_params)
    if @toy.save
      redirect_to current_user
    else
      flash[:notice] = 'Bad :('
      render 'new'
    end
  end

  private

  def toy_params
    params.require(:toy).permit(%i[name user_id])
  end
end
