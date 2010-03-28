class AddIndexToPoints < ActiveRecord::Migration
  def self.up
    add_index :points, :team_id
  end

  def self.down
    remove_index :points, :team_id
  end
end
