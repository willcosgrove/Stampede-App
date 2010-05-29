class AddDayIdToStampeder < ActiveRecord::Migration
  def self.up
    add_column :stampeders, :day_id, :integer
  end

  def self.down
    remove_column :stampeders, :day_id
  end
end
