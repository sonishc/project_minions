class UsersController < ApplicationController
  def show
    user_confirm?
    @toys = current_user.toys
    respond_to do |format|
      format.html
      format.csv { send_data @toys.to_csv, filename: 'Personal toys.csv' }
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      render 'show'
    else
      flash[:error] = 'Sorry. User does not exist'
      render inline: '<%= current_user.name; flash[:error]%>'
    end
  end

  private

  def user_confirm?
    return if current_user.email_confirmed
    render partial: 'unconfirm'
  end
end
