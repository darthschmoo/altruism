class CreateSkills < ActiveRecord::Migration
  def self.up
    create_table :skills do |t|
      t.integer :parent_id
      t.integer :children_count
      t.integer :ancestors_count
      t.integer :descendants_count
      t.boolean :hidden
      t.string  :name
      t.string  :description
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :skills
  end
end
