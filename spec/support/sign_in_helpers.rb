module SignInHelpers
  def load_data(path, user)
    path.load
    path.input_email.set user.email
    path.input_password.set user.password

    path.sign_in_button.click
  end
end
