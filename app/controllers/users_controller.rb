class UsersController < ApplicationController
  def show
    @users_toy = current_user.toys.find_by(user_id: current_user.id)
    @toys = current_user.toys.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @toys.to_csv, filename: 'Personal toys.csv' }
    end
  end
end
