FactoryGirl.define do
  factory :user do
    email 'valid@example.com'
    name 'Users'
    sex 'male'
    age 22
    password 'test123321'
    password_confirmation 'test123321'
  end
end
