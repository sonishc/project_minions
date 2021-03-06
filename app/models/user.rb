class User < ApplicationRecord
  before_create :confirmation_token
  has_many :toys, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :roles, through: :assignments

  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\z}

  validates :email, uniqueness: true
  validates :name, :age, :sex, presence: true
  validates :age, numericality: { only_integer: true,
                                  less_than: 140, greater_than: 4 }

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
