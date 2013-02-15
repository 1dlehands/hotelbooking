class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password_digest, :password, :password_confirmation

  validates_presence_of :email, :password, :password_confirmation
  validates_confirmation_of :password
  validates_uniqueness_of :email
  
end
