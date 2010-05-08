class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name

      t.timestamps
    end
    Team.create([{:name => "Red"},{:name => "Green"},{:name => "Blue"},{:name => "Yellow"}])
  end

  def self.down
    drop_table :teams
  end
end
