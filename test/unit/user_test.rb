require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def test_should_be_valid
    user = User.new(:username => "mellie", :password => "12345", :password_confirmation => "12345", :email => "hello@there.com")
    assert user.valid?, "user is not valid."
    assert user.save, "user did not save correctly."
    assert !user.crypted_password.nil?, "Encrypted password should not be nil"
    assert user.password != "12345"
  end
end
