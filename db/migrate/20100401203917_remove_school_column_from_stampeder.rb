class RemoveSchoolColumnFromStampeder < ActiveRecord::Migration
  def self.up
    remove_column :stampeders, :school
  end

  def self.down
    add_column :stampeders, :school, :string
  end
end
