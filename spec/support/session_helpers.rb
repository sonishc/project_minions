module SessionHelpers
  def sign_up_with(name, email, sex, age, password, password_confirmation)
    visit new_user_registration_path

    fill_in 'Name', with: name
    choose sex
    fill_in 'Age', with: age
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in_for_confirmed_user
    user = FactoryGirl.create(:user)
    user.email_confirmed = true
    user.save

    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'log in'
  end

  def sign_in_with(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'log in'
  end
end
