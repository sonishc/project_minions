class UsersController < ApplicationController
  def show
    user_confirm?
    @toys = current_user.toys
    respond_to do |format|
      format.html
      format.csv { send_data @toys.to_csv, filename: 'Personal toys.csv' }
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Successful update :)'
      redirect_to admin_user_path
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User deleted'
    redirect_to admin_users_path
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      render 'show'
    else
      flash.now[:error] = 'Sorry. User does not exist'
      render inline: '<%= current_user.name; flash.now[:error]%>'
    end
  end

  private

  def user_confirm?
    return if current_user.email_confirmed
    render partial: 'unconfirm'
  end

  def user_params
    params.require(:user).permit(:name, :sex, :age, :email, :image, :password,
                                 :password_confirmation)
  end
end
