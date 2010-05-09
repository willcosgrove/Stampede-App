class Stampeder < ActiveRecord::Base
  belongs_to :team
  belongs_to :school
  belongs_to :church
  belongs_to :stampeder, :class_name => "Stampeder", :foreign_key => "friend_id"
  has_many :stampeders, :class_name => "Stampeder", :foreign_key => "friend_id"
  has_many :signins
  
  
  validates_presence_of :firstname, :lastname, :grade, :gender, :message => "- Can you make sure that you filled out first name, last name, grade, and gender?  We need those before we can go any further."
  validates_format_of :parentphone, :with => /\A\d{10}\z/, :allow_nil => true, :allow_blank => true, :message => "- Could you please double check the emergency phone number?  I don't think it's right."
  validates_format_of :studentphone, :with => /\d{10}/, :allow_nil => true, :allow_blank => true, :message => "- Can you make sure that the student phone number is correct?  I think it might be wrong."
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :allow_nil => true, :allow_blank => true, :message => "- Could you please double check the email address?  I don't think that's right."
  validates_length_of :zipcode, :is => 5, :allow_nil => true, :allow_blank => true, :message => "- Could you please take a look at the zip code?  I don't think it's a real zip code."
  validates_length_of :state, :is => 2, :allow_nil => true, :allow_blank => true, :message => "- Oops!  Make sure that the state field contains the two letter state abreviation rather than the full state name."
  
  def before_validation
    self.parentphone.gsub!(/\D/, "") unless self.parentphone.blank?    
    self.studentphone.gsub!(/\D/, "") unless self.studentphone.blank?
  end
  
  def before_create
    self.addfullname
    self.createSubgroup
    self.pickTeam if self.team.blank? && !self.online_signup
  end
  
  def name
    fullname
  end
  
  def name=(name)
    fullname = name unless name.blank?
  end
  
  def friend_name
    self.stampeder.fullname if self.stampeder
  end
  
  def friend_name=(name)
    self.stampeder = Stampeder.find_by_fullname(name) unless name.blank?
  end
  
  def school_name
    school.name if school
  end
  
  def school_name=(name)
    self.school = School.find_or_create_by_name(name) unless name.blank?
  end
  
  def church_name
    church.name if church
  end
  
  def church_name=(name)
    self.church = Church.find_or_create_by_name(name) unless name.blank?
  end
  
  def addfullname
    self.fullname = "#{self.firstname} #{self.lastname}"
  end
  
  def addCapitalization
    self.firstname.capitalize!
    self.lastname.capitalize!
    a = self.parent.split
    a = a.collect do |x| x.capitalize end
    self.parent = a.join(' ')
  end
  
  def studentphone_for_view
    num = self.studentphone.insert(0, "(")
    num = num.insert(4, ")")
    num = num.insert(5, "-")
    num = num.insert(9, "-")
  end
  
  def parentphone_for_view
    num = self.parentphone.insert(0, "(")
    num = num.insert(4, ")")
    num = num.insert(5, "-")
    num = num.insert(9, "-")
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
      teamArrayID = teamSizes.index(sortedTeamSizes.first)
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
  
  def performSignin
    Signin.create(:stampeder_id => self.id, :day_signed_in => Time.now)
  end
  
  def gender_for_view
    if self.gender == "m"
      return "Boy"
    elsif self.gender == "f"
      return "Girl"
    else
      return nil
    end
  end
  
  def missingInfo?
    if self.dob.blank? || self.parent.blank? || self.parentphone.blank? || self.barcode.blank? || self.school.blank? || self.studentphone.blank? || self.textmsg.blank? || self.email.blank? || self.address.blank? || self.city.blank? || self.state.blank? || self.zipcode.blank?
      return true
    else
      return false
    end
  end
  
end