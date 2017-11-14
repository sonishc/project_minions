class ExampleMailer < ActionMailer::Base
  default from: 'from@example.com'

  def sample_email(user, toy, logs)
    @user = user
    @toy = toy
    @logs = logs
    mail(to: @user.email, subject: 'Minion event')
  end
end
