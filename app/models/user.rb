class User < ApplicationRecord
  has_many :toys

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def invite
    SendNewUserInvitationJob.perform_later(id)
  end
end
