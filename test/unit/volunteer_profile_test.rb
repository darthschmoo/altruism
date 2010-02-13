require 'test_helper'

class VolunteerProfileTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert VolunteerProfile.new.valid?
  end
end
