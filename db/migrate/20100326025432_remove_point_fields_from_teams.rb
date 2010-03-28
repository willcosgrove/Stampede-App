class RemovePointFieldsFromTeams < ActiveRecord::Migration
  def self.up
    remove_column :teams, :previous_points
    remove_column :teams, :indoor_games_points
    remove_column :teams, :outdoor_games_points
    remove_column :teams, :friend_points
    remove_column :teams, :spirit_points
    remove_column :teams, :deductions
  end

  def self.down
    add_column :teams, :previous_points, :integer
    add_column :teams, :indoor_games_points, :integer
    add_column :teams, :outdoor_games_points, :integer
    add_column :teams, :friend_points, :integer
    add_column :teams, :spirit_points, :integer
    add_column :teams, :deductions, :integer
  end
end
