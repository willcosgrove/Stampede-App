class AddFullNameToStampederForAutoComplete < ActiveRecord::Migration
  def self.up
  	add_column :stampeders, :fullname, :string
  end

  def self.down
  	remove_column :stampeders, :fullname
  end
end
