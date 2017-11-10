class RegistrationsController < Devise::RegistrationsController
  private

  def add_new_user_params
    user_params = params.require(:user)
    user_params.permit(%i[name age sex email password password_confirmation])
  end

  def sign_up_params
    add_new_user_params
  end

  def account_update_params
    add_new_user_params
  end
end
