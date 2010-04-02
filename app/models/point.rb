class Point < ActiveRecord::Base
  belongs_to :team
  def friend_points
    @stampeders = team.stampeders
    @stampeders.each do |stampeder|
      if stampeder.created_at.to_s == Time.now.strftime("%Y-%m-%d")
        @todaysStampeders += [stampeder]
      end
    end
    @todaysStampeders.size * 10000
  end
  
end
