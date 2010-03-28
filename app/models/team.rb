class Team < ActiveRecord::Base
  has_many :stampeders
  has_many :points
  
  validates_presence_of :name
end
