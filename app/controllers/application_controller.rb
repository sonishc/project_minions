class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  protected

  def authorize
    return if current_user.roles[0]&.name == 'admin'
      redirect_to current_user
  end
end
