class RemoveBarcodeFromStampeder < ActiveRecord::Migration
  def self.up
    remove_column :stampeders, :barcode
  end

  def self.down
    add_column :stampeders, :barcode, :string
  end
end
