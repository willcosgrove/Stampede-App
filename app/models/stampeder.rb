class Stampeder < ActiveRecord::Base
  belongs_to :team
  belongs_to :stampeder, :class_name => "Stampeder", :foreign_key => "friend_id"
  has_many :stampeders, :class_name => "Stampeder", :foreign_key => "friend_id"
  
  validates_presence_of :firstname, :lastname, :grade, :gender, :message => "Can you make sure that you filled out first name, last name, grade, and gender?  We need those before we can go any further."
  #validates_inclusion_of :barcode, :in => 111111111..999999999, :message => 'invalid barcode'
  validates_format_of :parentphone, :with => /\A\d{10}\z/, :message => "Could you please double check the emergency phone number?  I don't think it's right."
  validates_format_of :studentphone, :with => /\d{10}/, :allow_nil => true, :message => "Can you make sure that the student phone number is correct?  I think it might be wrong."
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :allow_nil => true, :message => "Could you please double check the email address?  I don't think that's right."
  validates_length_of :zipcode, :is => 5, :message => "Could you please take a look at the zip code?  I don't think it's a real zip code."
  
  def friend_name
    stampeder.name if stampeder
  end
  
  def friend_name=(name)
    self.stampeder = Stampeder.find_by_fullname(name) unless name.blank?
  end
  
  def addfullname
    self.fullname = "#{self.firstname} #{self.lastname}"
    save
  end
  
  def addCapitalization
    self.firstname.capitalize!
    self.lastname.capitalize!
    self.parent.capitalize!
  end
  
  def pickTeam
    redTeam = Team.find_by_name("Red")
    blueTeam = Team.find_by_name("Blue")
    greenTeam = Team.find_by_name("Green")
    yellowTeam = Team.find_by_name("Yellow")
    
    sgroup = self.subgroup
    teamSubgroupSizes = [greenTeam.stampeders.find_all_by_subgroup(sgroup).size, yellowTeam.stampeders.find_all_by_subgroup(sgroup).size, redTeam.stampeders.find_all_by_subgroup(sgroup).size, blueTeam.stampeders.find_all_by_subgroup(sgroup).size]
    sortedTeamSubgroupSizes = teamSubgroupSizes.sort
    subgroupArrayID = teamSubgroupSizes.index(sortedTeamSubgroupSizes.first)
    self.team = case subgroupArrayID
      when 0 then greenTeam
      when 1 then yellowTeam
      when 2 then redTeam
      when 3 then blueTeam
    end
    
    teamSizes = [greenTeam.stampeders.size, yellowTeam.stampeders.size, redTeam.stampeders.size, blueTeam.stampeders.size]
    sortedTeamSizes = teamSizes.sort
    
    if sortedTeamSizes.last - sortedTeamSizes.first >= 5 && !self.stampeder
      teamArrayID = teamSizes.index(sortedTeamSize.first)
      self.team = case teamArrayID
        when 0 then greenTeam
        when 1 then yellowTeam
        when 2 then redTeam
        when 3 then blueTeam
      end
    end
    
    if self.stampeder
      self.team = self.stampeder.team
    end
    
  end
  
  def createSubgroup
    self.subgroup = self.grade.to_s + self.gender.to_s
  end
  
end