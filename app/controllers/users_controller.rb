class UsersController < ApplicationController
  def show
    @toys = Toy.where(user_id: current_user.id)
    @toy = Toy.find_by(user_id: current_user.id)
  end
end
