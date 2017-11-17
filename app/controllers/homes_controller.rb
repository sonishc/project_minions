class HomesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    return if current_user.nil?
    redirect_to current_user unless current_user.email_confirmed
  end
end
