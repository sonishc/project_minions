require 'spec_helper'

feature 'User sign in', type: :feature, js: true do
  include SignInHelpers

  let!(:sessions_new) { ProjectMinions::Pages::Devise::Sessions::New.new }
  given!(:user) { FactoryGirl.create(:user) }

  scenario 'Login users with valid email and password' do
    user.email_confirmed = true
    user.save

    load_data sessions_new, user
    expect(sessions_new).to have_content('Personal page')
  end

  scenario 'Login with invalid email' do
    user.email = 'invalid_example.com'
    user.save

    load_data sessions_new, user
    expect(sessions_new).to have_content('Log in')
  end

  scenario 'Login with blank password' do
    user.password = ''
    user.save

    load_data sessions_new, user
    expect(sessions_new).to have_content('Log in')
  end
end
