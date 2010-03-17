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

end