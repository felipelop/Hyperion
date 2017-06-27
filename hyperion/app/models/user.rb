class User < ActiveRecord::Base 
  has_secure_password
  validates :login, presence: true, length: {maximum: 50}
  validates :password, presence: true, length: {minimum: 5}
end