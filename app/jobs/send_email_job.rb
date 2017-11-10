class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(toy_id, user_id)
    @user = User.find_by(id: user_id)
    @toy = Toy.find_by(id: toy_id)
    @logs = @toy.logs
    ExampleMailer.sample_email(@user, @toy, @logs).deliver
  end
end
