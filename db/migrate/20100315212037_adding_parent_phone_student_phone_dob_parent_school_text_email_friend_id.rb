class AddingParentPhoneStudentPhoneDobParentSchoolTextEmailFriendId < ActiveRecord::Migration
  def self.up
  	add_column :stampeders, :parentphone, :string
  	add_column :stampeders, :studentphone, :string
  	add_column :stampeders, :dob, :date
  	add_column :stampeders, :parent, :string
  	add_column :stampeders, :school, :string
  	add_column :stampeders, :text, :boolean
  	add_column :stampeders, :email, :string
  	add_column :stampeders, :friend_id, :integer
  	add_index :stampeders, :friend_id
  end

  def self.down
  	remove_index :stampeders, :friend_id
  	remove_column :stampeders, :parentphone, :string
  	remove_column :stampeders, :studentphone, :string
  	remove_column :stampeders, :dob, :date
  	remove_column :stampeders, :parent, :string
  	remove_column :stampeders, :school, :string
  	remove_column :stampeders, :text, :boolean
  	remove_column :stampeders, :email, :string
  	remove_column :stampeders, :friend_id, :integer
  end
end
