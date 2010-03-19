class ChangeZipCodeFromIntegerToString < ActiveRecord::Migration
  def self.up
  	change_column :stampeders, :zipcode, :string
  end

  def self.down
  	change_column :stampeders, :zipcode, :integer
  end
end
