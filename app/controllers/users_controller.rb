class UsersController < ApplicationController
  def show
    user_confirm?
    @toys = current_user.toys.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @toys.to_csv, filename: 'Personal toys.csv' }
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the Sample App! Your email has
       been confirmed. Please sign in to continue."
      render 'show'
    else
      flash[:error] = 'Sorry. User does not exist'
      render inline: '<%= current_user.name; flash[:error]%>'
    end
  end

  private

  def user_confirm?
    return if current_user.email_confirmed
    flash.now[:error] = "#{current_user.name}: please activate your account by
     following the instructions in the account confirmation email you received
      to proceed"
    render inline: '<%= current_user.name; flash[:error]%>'
  end
end
