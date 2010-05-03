class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name
      t.integer :previous_points
      t.integer :indoor_games_points
      t.integer :outdoor_games_points
      t.integer :friend_points
      t.integer :spirit_points
      t.integer :deductions

      t.timestamps
    end
    Team.create([{:name => "Red"},{:name => "Green"},{:name => "Blue"},{:name => "Yellow"}])
  end

  def self.down
    drop_table :teams
  end
end
