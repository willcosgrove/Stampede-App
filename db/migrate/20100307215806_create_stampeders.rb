class CreateStampeders < ActiveRecord::Migration
  def self.up
    create_table :stampeders do |t|
      t.string :lastname
      t.string :firstname
      t.integer :barcode
      t.integer :phone
      t.string :address
      t.integer :grade
      t.string :city
      t.string :state
      t.integer :gender

      t.timestamps
    end
  end

  def self.down
    drop_table :stampeders
  end
end
