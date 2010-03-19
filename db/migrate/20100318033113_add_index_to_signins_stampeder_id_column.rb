class AddIndexToSigninsStampederIdColumn < ActiveRecord::Migration
  def self.up
    add_index :signins, :stampeder_id
  end

  def self.down
    remove_index :signins, :stampeder_id
  end
end
