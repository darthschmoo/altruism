# http://api.rubyonrails.org/classes/ActiveRecord/Migration.html
class CreateHoursMigration < ActiveRecord::Migration
  def self.up
    create_table :hours do |t|
      t.integer :day  # 0-6, Sunday thru Saturday?
      t.integer :start_at # minutes into day (midnight to midnight)
      t.integer :end_at   # minutes into day (midnight to midnight)
      t.integer :hours_target_id
      t.string  :hours_target_type

      t.timestamps
    end
  end

  def self.down
    drop_table :hours
  end
end
