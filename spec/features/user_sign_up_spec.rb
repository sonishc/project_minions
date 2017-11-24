require 'spec_helper'

feature 'User sign up', js: true do
  let(:register_new) { ProjectMinions::Pages::Devise::New.new }

  let(:user) { FactoryGirl.create(:user) }

  scenario 'Sign up with valid user data' do
    register_new.load
    register_new.input_name.set user.name
    register_new.input_male.set user.sex
    register_new.input_age.set user.age
    register_new.input_email.set 'valid@gmail.com'
    register_new.input_password.set user.password
    register_new.input_password_confirmation.set user.password

    register_new.sign_up_button.click

    expect(register_new).to have_content('Please activate your account')
  end
end
