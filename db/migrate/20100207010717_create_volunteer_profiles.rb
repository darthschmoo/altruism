class CreateVolunteerProfiles < ActiveRecord::Migration
  def self.up
    create_table :volunteer_profiles do |t|
      t.integer :user_id
      t.text    :bio
      t.text    :motives
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :volunteer_profiles
  end
end
