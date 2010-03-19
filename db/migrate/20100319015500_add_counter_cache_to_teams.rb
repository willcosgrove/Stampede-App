class AddCounterCacheToTeams < ActiveRecord::Migration
  def self.up
    add_column :teams, :stampeders_count, :integer, :default => 0
    Team.find(:all).each do |t|
      t.update_attribute :stampeders_count, t.stampeders.length
    end
  end

  def self.down
    remove_column :teams, :stampeders_count
  end
end
