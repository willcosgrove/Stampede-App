class Team < ActiveRecord::Base
  has_many :stampeders
  
  validates_presence_of :name
end
