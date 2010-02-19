class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :username, :email, :password, :password_confirmation
  has_one :volunteer_profile

  def anonymous?
    false
  end
end
