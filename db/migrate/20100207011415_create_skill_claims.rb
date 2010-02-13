class CreateSkillClaims < ActiveRecord::Migration
  def self.up
    create_table :skill_claims do |t|
      t.integer :skill_id
      t.integer :volunteer_profile_id
      t.integer :rating

      t.timestamps
    end
  end

  def self.down
    drop_table :skill_claims
  end
end
