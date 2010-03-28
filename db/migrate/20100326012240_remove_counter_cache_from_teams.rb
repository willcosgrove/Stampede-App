class RemoveCounterCacheFromTeams < ActiveRecord::Migration
  def self.up
    remove_column :teams, :stampeders_count
  end

  def self.down
    add_column :teams, :stampeders_count, :integer, :default => 0
    Team.find(:all).each do |t|
      t.update_attribute :stampeders_count, t.stampeders.length
    end
  end
end
