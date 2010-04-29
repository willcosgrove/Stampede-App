class CreateChurches < ActiveRecord::Migration
  def self.up
    create_table :churches do |t|
      t.string :name
      
      t.timestamps
    end
  end

  def self.down
    drop_table :churches
  end
end
