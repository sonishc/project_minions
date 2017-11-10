class UsersController < ApplicationController
  def show
    @users_toy = current_user.toys.find_by( user_id: current_user.id )
  end
end
