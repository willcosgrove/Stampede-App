class CreatePoints < ActiveRecord::Migration
  def self.up
    create_table :points do |t|
      t.integer :team_id
      t.date :day
      t.integer :previous_points
      t.integer :indoor_games
      t.integer :outdoor_games
      t.integer :spirit_points
      t.integer :deductions
      t.boolean :most_friends

      t.timestamps
    end
  end

  def self.down
    drop_table :points
  end
end
