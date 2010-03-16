class ChangeGenderFromIntegerToString < ActiveRecord::Migration
  def self.up
    remove_column :stampeders, :gender
    add_column :stampeders, :gender, :string
  end

  def self.down
    remove_column :stampeders, :gender
    add_column :stampeders, :gender, :integer
  end
end
