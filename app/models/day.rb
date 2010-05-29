class Day < ActiveRecord::Base
  has_many :stampeders, :class_name => "Stampeder", :foreign_key => "day_id"
end
