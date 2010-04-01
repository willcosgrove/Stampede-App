class AddSchoolIdToStampeder < ActiveRecord::Migration
  def self.up
    add_column :stampeders, :school_id, :integer
    add_index :stampeders, :school_id
  end

  def self.down
    remove_index :stampeders, :school_id
    remove_column :stampeders, :school_id
  end
end
