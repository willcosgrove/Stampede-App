class Stampeder < ActiveRecord::Base
  belongs_to :team
  
  validates_presence_of :firstname, :lastname, :team_id, :grade
  validates_inclusion_of :barcode, :in => 111111111..999999999, :message => 'invalid barcode'
  #validates_length_of :phone.to_s, :is => 10, :message => 'invalid phone number.  must be a standard 10-digit US phone number'
end
