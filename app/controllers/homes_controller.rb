class HomesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    return if current_user.nil? || current_user.email_confirmed
    redirect_to current_user
  end
end
