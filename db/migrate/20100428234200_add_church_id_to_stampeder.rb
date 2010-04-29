class AddChurchIdToStampeder < ActiveRecord::Migration
  def self.up
    add_column :stampeders, :church_id, :integer
    add_index :stampeders, :church_id
  end

  def self.down
    remove_index :stampeders, :church_id
    remove_column :stampeders, :church_id
  end
end
