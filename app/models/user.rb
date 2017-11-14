class User < ApplicationRecord
  has_many :toys

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
