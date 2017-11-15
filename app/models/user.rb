class User < ApplicationRecord
  before_create :confirmation_token
  has_many :toys
  validates :email, :age, :sex, presence: true
  validates :age, numericality: { only_integer: true, less_than: 140 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
  end

  private

  def confirmation_token
    return unless confirm_token.blank?
    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end
end
