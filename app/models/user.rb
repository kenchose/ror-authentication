class User < ActiveRecord::Base
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, confirmation: true
end
