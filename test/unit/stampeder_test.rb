require 'test_helper'

class StampederTest < ActiveSupport::TestCase
  
  def test_should_not_be_valid_without_lastname
    s = Stampeder.create( :lastname => nil, :firstname => "fname", :barcode => 7628, :studentphone => "7269281827", :address => "382 Jabl", :grade => 6, :city => "Fort Worth", :state => "TX", :team_id => 2, :subgroup => "6f", :gender => "f", :zipcode => "67523", :parentphone => "8176259837", :dob => nil, :parent => "Gangy", :school => "MSG", :text => false, :email => "shdj@jsh.com", :friend_id => nil, :fullname => "fname " )
    assert s.errors.on(:lastname)
  end
  
  def test_should_not_be_valid_without_firstname
    s = Stampeder.create( :lastname => "lname", :firstname => nil, :barcode => 7628, :studentphone => "7269281827", :address => "382 Jabl", :grade => 6, :city => "Fort Worth", :state => "TX", :team_id => 2, :subgroup => "6f", :gender => "f", :zipcode => "67523", :parentphone => "8176259837", :dob => nil, :parent => "Gangy", :school => "MSG", :text => false, :email => "shdj@jsh.com", :friend_id => nil, :fullname => " lname" )
    assert s.errors.on(:firstname)
  end
  
  def test_should_not_be_valid_without_parentphone
    s = Stampeder.create( :lastname => "lname", :firstname => "fname", :barcode => 7628, :studentphone => "7269281827", :address => "382 Jabl", :grade => 6, :city => "Fort Worth", :state => "TX", :team_id => 2, :subgroup => "6f", :gender => "f", :zipcode => "67523", :parentphone => nil, :dob => nil, :parent => "Gangy", :school => "MSG", :text => false, :email => "shdj@jsh.com", :friend_id => nil, :fullname => "fname lname" )

    assert s.errors.on(:parentphone)
  end
  
  def test_should_not_be_valid_with_11_digit_parentphone
    s = Stampeder.create( :lastname => "lname", :firstname => "fname", :barcode => 7628, :studentphone => "7269281827", :address => "382 Jabl", :grade => 6, :city => "Fort Worth", :state => "TX", :team_id => 2, :subgroup => "6f", :gender => "f", :zipcode => "67523", :parentphone => "81762598378", :dob => nil, :parent => "Gangy", :school => "MSG", :text => false, :email => "shdj@jsh.com", :friend_id => nil, :fullname => "fname lname" )
    assert s.errors.on(:parentphone)
  end
  
  def test_should_not_be_valid_with_incorrectly_formatted_email
    s = Stampeder.create( :lastname => "lname", :firstname => "fname", :barcode => 7628, :studentphone => "7269281827", :address => "382 Jabl", :grade => 6, :city => "Fort Worth", :state => "TX", :team_id => 2, :subgroup => "6f", :gender => "f", :zipcode => "67523", :parentphone => "8176259837", :dob => nil, :parent => "Gangy", :school => "MSG", :text => false, :email => "shdjjsh.com", :friend_id => nil, :fullname => "fname lname" )
    assert s.errors.on(:email)
  end
  
  def test_should_not_be_valid_with_a_zipcode_that_is_too_short
    s = Stampeder.create( :lastname => "lname", :firstname => "fname", :barcode => 7628, :studentphone => "7269281827", :address => "382 Jabl", :grade => 6, :city => "Fort Worth", :state => "TX", :team_id => 2, :subgroup => "6f", :gender => "f", :zipcode => "6752", :parentphone => "8176259837", :dob => nil, :parent => "Gangy", :school => "MSG", :text => false, :email => "shdj@jsh.com", :friend_id => nil, :fullname => "fname lname" )
    assert s.errors.on(:zipcode)
  end
  
  def test_should_not_be_valid_with_a_zipcode_that_is_too_long
    s = Stampeder.create( :lastname => "lname", :firstname => "fname", :barcode => 7628, :studentphone => "7269281827", :address => "382 Jabl", :grade => 6, :city => "Fort Worth", :state => "TX", :team_id => 2, :subgroup => "6f", :gender => "f", :zipcode => "675237", :parentphone => "8176259837", :dob => nil, :parent => "Gangy", :school => "MSG", :text => false, :email => "shdj@jsh.com", :friend_id => nil, :fullname => "fname lname" )
    assert s.errors.on(:zipcode)
  end
  
  def test_that_stampeder_gets_put_on_same_team_as_friend
    redTeam = Team.create :id => teams(:redteam).id,
                          :name => teams(:redteam).name,
                          :previous_points => teams(:redteam).previous_points,
                          :indoor_games_points => teams(:redteam).indoor_games_points,
                          :outdoor_games_points => teams(:redteam).outdoor_games_points,
                          :friend_points => teams(:redteam).friend_points,
                          :spirit_points => teams(:redteam).spirit_points,
                          :deductions => teams(:redteam).deductions
    
    blueTeam = Team.create  :id => teams(:blueteam).id,
                            :name => teams(:blueteam).name,
                            :previous_points => teams(:blueteam).previous_points,
                            :indoor_games_points => teams(:blueteam).indoor_games_points,
                            :outdoor_games_points => teams(:blueteam).outdoor_games_points,
                            :friend_points => teams(:blueteam).friend_points,
                            :spirit_points => teams(:redteam).spirit_points,
                            :deductions => teams(:blueteam).deductions
                            
    greenTeam = Team.create :id => teams(:greenteam).id,
                            :name => teams(:greenteam).name,
                            :previous_points => teams(:greenteam).previous_points,
                            :indoor_games_points => teams(:greenteam).indoor_games_points,
                            :outdoor_games_points => teams(:greenteam).outdoor_games_points,
                            :friend_points => teams(:greenteam).friend_points,
                            :spirit_points => teams(:greenteam).spirit_points,
                            :deductions => teams(:greenteam).deductions
                            
    yellowTeam = Team.create  :id => teams(:yellowteam).id,
                              :name => teams(:yellowteam).name,
                              :previous_points => teams(:yellowteam).previous_points,
                              :indoor_games_points => teams(:yellowteam).indoor_games_points,
                              :outdoor_games_points => teams(:yellowteam).outdoor_games_points,
                              :friend_points => teams(:yellowteam).friend_points,
                              :spirit_points => teams(:yellowteam).spirit_points,
                              :deductions => teams(:yellowteam).deductions
                              
    headFriend = Stampeder.new   :lastname => stampeders(:one).lastname,
                                  :firstname => stampeders(:one).firstname,
                                  :barcode => stampeders(:one).barcode,
                                  :studentphone => stampeders(:one).studentphone,
                                  :address => stampeders(:one).address,
                                  :grade => stampeders(:one).grade,
                                  :city => stampeders(:one).city,
                                  :state => stampeders(:one).state,
                                  :team_id => stampeders(:one).team_id,
                                  :subgroup => stampeders(:one).subgroup,
                                  :gender => stampeders(:one).gender,
                                  :zipcode => stampeders(:one).zipcode,
                                  :parentphone => stampeders(:one).parentphone,
                                  :dob => stampeders(:one).dob,
                                  :parent => stampeders(:one).parent,
                                  :school => stampeders(:one).school,
                                  :text => stampeders(:one).text,
                                  :email => stampeders(:one).email,
                                  :friend_id => stampeders(:one).friend_id,
                                  :fullname => stampeders(:one).fullname
                                  
    headFriend.save
    
    s = Stampeder.create          :lastname => stampeders(:two).lastname,
                                  :firstname => stampeders(:two).firstname,
                                  :barcode => stampeders(:two).barcode,
                                  :studentphone => stampeders(:two).studentphone,
                                  :address => stampeders(:two).address,
                                  :grade => stampeders(:two).grade,
                                  :city => stampeders(:two).city,
                                  :state => stampeders(:two).state,
                                  :team_id => stampeders(:two).team_id,
                                  :subgroup => stampeders(:two).subgroup,
                                  :gender => stampeders(:two).gender,
                                  :zipcode => stampeders(:two).zipcode,
                                  :parentphone => stampeders(:two).parentphone,
                                  :dob => stampeders(:two).dob,
                                  :parent => stampeders(:two).parent,
                                  :school => stampeders(:two).school,
                                  :text => stampeders(:two).text,
                                  :email => stampeders(:two).email,
                                  :friend_id => stampeders(:two).friend_id,
                                  :fullname => stampeders(:two).fullname
    s.pickTeam
    puts headFriend.id
    puts headFriend.team_id
    puts s.team_id
    assert s.team == headFriend.team
  end
  
end