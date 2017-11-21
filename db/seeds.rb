Role.create(
  name: 'admin'
)

User.create(
  email: 'onixsonic@gmail.com',
  name: 'Serhii',
  sex: 'male',
  age: 23,
  password: ENV['USER_PASSWORD_DEV'],
  password_confirmation: ENV['USER_PASSWORD_DEV'],
  email_confirmed: true,
  confirm_token: nil
)

Assignment.create(
  user_id: 1,
  role_id: 1
)
