class AddGradeGenderSubgroup < ActiveRecord::Migration
  def self.up
    add_column :stampeders, :subgroup, :string
  end

  def self.down
  	remove_column :stampeders, :subgroup
  end
end
