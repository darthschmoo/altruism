class CreateHours < ActiveRecord::Migration
  def self.up
    create_table :hours do |t|
      t.string  :hours_target_type
      t.integer :hours_target_id

      t.integer :day_of_week    # 0-6, Sunday being day 0 (follows Date.wday conventions)
      t.integer :start_at
      t.integer :end_at
    end
  end
end
