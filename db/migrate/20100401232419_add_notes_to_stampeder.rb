class AddNotesToStampeder < ActiveRecord::Migration
  def self.up
    add_column :stampeders, :notes, :text
  end

  def self.down
    remove_column :stampeders, :notes
  end
end
