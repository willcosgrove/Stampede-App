class RemoveStudentphoneRenamePhoneToStudentphone < ActiveRecord::Migration
  def self.up
  	remove_column :stampeders, :studentphone
  	rename_column :stampeders, :phone, :studentphone
  end

  def self.down
  	rename_column :stampeders, :studentphone, :phone
  	add_column :stampeders, :studentphone
  end
end
