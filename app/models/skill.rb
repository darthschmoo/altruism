class Skill < ActiveRecord::Base
  attr_accessible :parent_id, :children_count, :ancestors_count, :descendants_count, :hidden, :name, :description, :position
  acts_as_category

  has_many :volunteer_profiles, :through => :skill_claims
  has_many :skill_claims
end
