class RegistrationsController < Devise::RegistrationsController
  def create
    super
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = 'Please confirm your email address to continue'
    else
      flash[:error] = 'Ooooppss, something went wrong!'
    end
  end

  private

  def add_new_user_params
    user_params = params.require(:user)
    user_params.permit(%i[name age sex email password password_confirmation])
  end

  def sign_up_params
    add_new_user_params
  end
end
