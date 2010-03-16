class ChangePhoneFromIntegerToString < ActiveRecord::Migration
  def self.up
  	change_column :stampeders, :phone, :string
  end

  def self.down
  	change_column :stampeders, :phone, :integer
  end
end
