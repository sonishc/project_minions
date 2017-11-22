class Admin::DashboardController < ApplicationController
  layout 'dashboard'
  before_action :authorize

  def index; end

  def show; end
end
