require 'spec_helper'

include SessionHelpers

feature 'User sign up', js: true do
  scenario 'with valid name email sex age password password_confirmation' do
    sign_up_with 'Test', 'valid@example.com', 'male',
                 23, 'password', 'password'
    expect(page).to have_content('Please activate your account')
  end

  scenario 'with valid email and password' do
    sign_in_for_confirmed_user

    expect(page).to have_content('Personal page')
  end

  scenario 'with invalid email' do
    sign_in_with 'invalid_email', 'password'

    expect(page).to have_content('Log in')
  end

  scenario 'with blank password' do
    sign_in_with 'valid@example.com', ''

    expect(page).to have_content('Log in')
  end
end
