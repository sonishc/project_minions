class Admin::DashboardController < ApplicationController
  before_action :authorize

  def index; end

  private

  def authorize
    if current_user.name == 'asf'
    else
    redirect_to [current_user]
    end
  end
end
