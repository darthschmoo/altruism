require 'test_helper'

class SkillTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Skill.new.valid?
  end
end
