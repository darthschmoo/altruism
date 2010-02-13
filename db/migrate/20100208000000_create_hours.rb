class CreateHours < ActiveRecord::Migration
  def self.up
    create_table :hours do |t|
      t.string  :hours_target_type
      t.integer :hours_target_id

      t.integer :day_of_week
      t.integer :start_at
      t.integer :end_at
    end
  end
end
