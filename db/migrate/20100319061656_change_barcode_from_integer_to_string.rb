class ChangeBarcodeFromIntegerToString < ActiveRecord::Migration
  def self.up
    change_column :stampeders, :barcode, :string
  end

  def self.down
    change_column :stampeders, :barcode, :integer
  end
end
