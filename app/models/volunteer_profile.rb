class VolunteerProfile < ActiveRecord::Base
  belongs_to :user
  has_many :skills, :through => :skill_claims
  has_many :skill_claims

  # TODO:
  # has contact information
  # has_email :as => home_email
  # has_phone_numbers :count => 3
  # zip code (for looking up distances?)
  has_hours :label => :available  # [should give a list of times when volunteer is available to work.  Mon 8-11AM, Mon 8PM-midnight, Wednesday 6PM-11PM, etc.
end
