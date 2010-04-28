class AddOnlineSignupBooleanToStampeder < ActiveRecord::Migration
  def self.up
    add_column :stampeders, :online_signup, :boolean
  end

  def self.down
    remove_column :stampeders, :online_signup
  end
end
