class AddParentEmailToStampeder < ActiveRecord::Migration
  def self.up
    add_column :stampeders, :parentemail, :string
  end

  def self.down
    remove_column :stampeders, :parentemail
  end
end
