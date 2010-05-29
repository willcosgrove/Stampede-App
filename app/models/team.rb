class Team < ActiveRecord::Base
  has_many :stampeders
  has_many :points
  
  validates_presence_of :name
  
  def calculate_friend_points
    stampeders = Stampeder.find_all_by_day_id_and_team_id(Day.last.id, self.id)
    totalFriends = 0
    for s in stampeders do
      totalFriends += 1 if s.stampeder
    end
    return totalFriends * 10000
  end
end
