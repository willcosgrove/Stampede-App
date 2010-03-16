class AddZipCodeToStampeder < ActiveRecord::Migration
  def self.up
  	add_column :stampeders, :zipcode, :integer
  end

  def self.down
    remove_column :stampeders, :zipcode
  end
end
