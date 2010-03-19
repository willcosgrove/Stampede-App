class CreateSignins < ActiveRecord::Migration
  def self.up
    create_table :signins do |t|
      t.integer :stampeder_id
      t.date :day_signed_in

      t.timestamps
    end
  end

  def self.down
    drop_table :signins
  end
end
