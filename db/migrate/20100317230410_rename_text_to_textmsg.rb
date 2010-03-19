class RenameTextToTextmsg < ActiveRecord::Migration
  def self.up
    rename_column :stampeders, :text, :textmsg
  end

  def self.down
    rename_column :stampeders, :textmsg, :text
  end
end
