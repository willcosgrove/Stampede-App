class AddRelationshipToStampeders < ActiveRecord::Migration
  def self.up
    add_column :stampeders, :team_id, :integer
    add_index :stampeders, :team_id
  end

  def self.down
    remove_index :stampeders, :team_id
    remove_column :stampeders, :team_id
  end
end
