class AddIndexToStampederForSignupPeriod < ActiveRecord::Migration
  def self.up
    add_index :stampeders, :day_id
  end

  def self.down
    remove_index :stampeders, :day_id
  end
end
