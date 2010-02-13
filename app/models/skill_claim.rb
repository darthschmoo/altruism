class SkillClaim < ActiveRecord::Base
  belongs_to :skill
  belongs_to :volunteer_profile

  attr_accessible :rating
end
