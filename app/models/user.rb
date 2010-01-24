class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :username, :email, :password, :password_confirmation
  # attr_accessor :password, :password_confirmation
end
