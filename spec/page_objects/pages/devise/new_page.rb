module ProjectMinions
  module Pages
    module Devise
      module Sessions
        class New < SitePrism::Page
          set_url 'users/sign_in'

          element :input_email, "input[id='user_email']"
          element :input_password, "input[id='user_password']"
          element :sign_in_button, "input[type='submit']"
        end
      end
      class New < SitePrism::Page
        set_url 'users/sign_up'

        element :input_name, "input[id='user_name']"
        element :input_male, "input[id='user_sex_male']"
        element :input_female, "input[id='user_sex_female']"
        element :input_age, "input[id='user_age']"
        element :input_email, "input[id='user_email']"
        element :input_password, "input[id='user_password']"
        element :input_password_confirmation, "input[id='user_password_confirmation']"

        element :sign_up_button, "input[type='submit']"
      end
    end
  end
end
