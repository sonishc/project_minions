class ToysController < ApplicationController
  def show
    @toys = current_user.toys
    @toy = Toy.find_by(id: params[:id], user_id: current_user.id)
    return unless params[:state]
    return unless @toy.may_event?(params[:event])
    @toy.send("#{params[:event]}!")
  end

  def new
    @toy = Toy.new
  end

  def create
    @toy = Toy.new(toy_params)
    if @toy.save
      redirect_to current_user
    else
      flash[:notice] = 'Bad :('
      render 'new'
    end
  end

  def send_history
    @toy = Toy.find_by(id: params[:id], user_id: current_user.id)
    @toy.send_mail
  end

  private

  def toy_params
    params.require(:toy).permit(%i[name user_id])
  end
end
