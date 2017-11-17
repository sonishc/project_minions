class ToysController < ApplicationController
  def show
    @toys = current_user.toys
    @toy = @toys.find_by(id: params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @toy.to_json }
    end
  end

  def new
    @toy = Toy.new
  end

  def create
    @toy = Toy.new(toy_params)
    if @toy.save
      redirect_to current_user
    else
      flash.now[:error] = 'Incorrect name or empty field :('
      render 'new'
    end
  end

  def destroy
    @toy = Toy.find(params[:id]).destroy
    @toy.logs.destroy_all
    if current_user.toys.last.nil?
      redirect_to user_path
    else
      redirect_to user_toy_url(current_user, current_user.toys.last.id)
    end
  end

  def event_switch
    @toy = current_user.toys.find_by(id: params[:id])
    @toy.call_state(params[:state], params[:event])
    redirect_to [current_user, @toy]
  end

  def send_history
    Toy.find_by(id: params[:id], user_id: current_user.id).send_mail
  end

  private

  def toy_params
    params.require(:toy).permit(%i[name user_id])
  end
end
