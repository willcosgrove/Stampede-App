class Stampeder < ActiveRecord::Base
  belongs_to :team
  belongs_to :school
  belongs_to :church
  belongs_to :stampeder, :class_name => "Stampeder", :foreign_key => "friend_id"
  belongs_to :signup_period, :class_name => "Day", :foreign_key => "day_id"
  has_many :stampeders, :class_name => "Stampeder", :foreign_key => "friend_id"
  has_many :signins
  
  
  #validate do |user|
  #  user.errors.add_to_base('We need to know your first name') if user.firstname.blank?
  #  user.errors.add_to_base('Believe it or not, we need to know your last name') if user.lastname.blank?
  #  user.errors.add_to_base("We have to know what grade you're in so we can put you on a team") if user.grade.blank?
  #  user.errors.add_to_base('You forgot to say if you were a boy or a girl') if user.gender.blank?
  #end
  #before_save :strip_html
  validates_presence_of :firstname, :message => "We need to know your first name"
  validates_presence_of :lastname, :message => "Believe it or not, we need to know your last name"
  validates_presence_of :grade, :message => "We have to know what grade you're in so we can put you on a team"
  validates_presence_of :gender, :message => "You forgot to say if you were a boy or a girl"
  validates_presence_of :parentemail, :if => :online_signup, :message => "We need to have your parent's email."
  validates_presence_of :parent, :if => :online_signup, :message => "It'd be nice if we knew your parent's name.  And by, 'It'd be nice', we mean, we need to know."
  validates_presence_of :dob, :if => :online_signup, :message => "We need to make sure you're old enough/not too old for Stampede.  So go fill in your Birthday!"
  validates_presence_of :parentphone, :if => :online_signup, :message => "We need to have your parent's phone number in case of an emergency."
  validates_presence_of :church, :allow_nil => true, :if => :online_signup, :message => "We'd like to know which church you go to."
  validates_presence_of :school, :if => :online_signup, :message => "We'd like to know which school you go to."
  validates_presence_of :address, :if => :online_signup, :message => "We need to know your address."
  validates_presence_of :city, :if => :online_signup, :message => "We need to know in which city you live."
  #validates_format_of :parentphone, :with => /\A\d{10}\z/, :allow_nil => true, :allow_blank => true, :message => "- Could you please double check the emergency phone number?  I don't think it's right."
  #validates_format_of :studentphone, :with => /\d{10}/, :allow_nil => true, :allow_blank => true, :message => "- Can you make sure that the student phone number is correct?  I think it might be wrong."
  validates_format_of :studentphone, :allow_blank => true, :message => "I don't think your cell number, that you typed in, is a correct phone number.", :with => /^[\(\)0-9\- \+\.]{10}$/
  validates_format_of :parentphone, :message => "I don't think the emergency number, that you typed in, is a correct phone number.", :with => /^[\(\)0-9\- \+\.]{10}$/
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/, :allow_nil => true, :allow_blank => true, :message => "- Could you please double check the email address?  I don't think that's right."
  validates_length_of :zipcode, :is => 5, :allow_nil => true, :allow_blank => false, :message => "Could you please take a look at the zip code?  I don't think it's a real zip code."
  validates_length_of :state, :is => 2, :allow_nil => true, :allow_blank => false, :message => "- Oops!  Make sure that the state field contains the two letter state abreviation rather than the full state name."
  
  def before_validation
    unless self.parentphone.blank?
      self.parentphone.gsub!(/[^0-9]/, "")
    end
    unless self.studentphone.blank?
      self.studentphone.gsub!(/[^0-9]/, "")
    end
    if self.zipcode
      if self.zipcode.match(/\d{5}-\d{4}/)
        self.zipcode.slice!(0,5)
      end
    end
  end
  
  def strip_html # Automatically strips any tags from any string to text typed column
    for column in Product.content_columns
      if column.type == :string || column.type == :text # if the column is text-typed
        if !self[column.name].nil? # strip html from string if it's not empty
          self[column.name] = self[column.name].gsub(/<\/?[^>]*>/, "") 
        end
      end
    end
  end
  
  def before_create
    self.firstname = self.firstname.titleize
    self.lastname = self.lastname.titleize
    self.addfullname
    self.createSubgroup
    self.signup_period = Day.last
    self.pickTeam if self.team.blank? && !self.online_signup
    if self.email.blank?
      self.email = self.parentemail
    end
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
  
  def referral_code
    id * REFERRAL_CONSTANT.to_i
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
    
    unless self.stampeder.blank?
      if self.stampeder.team.blank?
        friend = self.stampeder
        friend.pickTeam
      end
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
    if self.dob.blank? || self.parent.blank? || self.parentphone.blank? || self.school.blank? || self.studentphone.blank? || self.textmsg.blank? || self.email.blank? || self.address.blank? || self.city.blank? || self.state.blank? || self.zipcode.blank?
      return true
    else
      return false
    end
  end
  
  def online_signup_is_false?
    !self.online_signup
  end
  
  def shared_on_facebook?
    url = "http://api.facebook.com/restserver.php?method=links.getStats&urls=register.stampede10.com/with_friend/" + self.referral_code.to_s
    responce = HTTParty.get(url)
    if responce["links_getStats_response"]["link_stat"]["share_count"].to_i > 0
      return true
    else
      return false
    end
  end
  
  def number_of_facebook_clicks
    url = "http://api.facebook.com/restserver.php?method=links.getStats&urls=register.stampede10.com/with_friend/" + self.referral_code.to_s
    responce = HTTParty.get(url)
    responce["links_getStats_response"]["link_stat"]["click_count"].to_i
  end
  
  def number_of_facebook_comments
    url = "http://api.facebook.com/restserver.php?method=links.getStats&urls=register.stampede10.com/with_friend/" + self.referral_code.to_s
    responce = HTTParty.get(url)
    responce["links_getStats_response"]["link_stat"]["comment_count"].to_i
  end
  
  def number_of_facebook_likes
    url = "http://api.facebook.com/restserver.php?method=links.getStats&urls=register.stampede10.com/with_friend/" + self.referral_code.to_s
    responce = HTTParty.get(url)
    responce["links_getStats_response"]["link_stat"]["like_count"].to_i
  end
  
  def self.total_number_of_facebook_shares
    url = "http://api.facebook.com/restserver.php?method=links.getStats&urls="
    Stampeder.all.each do |s|
      url += "register.stampede10.com/with_friend/" + s.referral_code.to_s + ","
    end
    responce = HTTParty.get(url)
    sum = 0
    responce["links_getStats_response"]["link_stat"].each do |link|
      sum += link["share_count"].to_i
    end
    sum
  end
  
  def self.total_number_of_facebook_clicks
    url = "http://api.facebook.com/restserver.php?method=links.getStats&urls="
    Stampeder.all.each do |s|
      url += "register.stampede10.com/with_friend/" + s.referral_code.to_s + ","
    end
    responce = HTTParty.get(url)
    sum = 0
    responce["links_getStats_response"]["link_stat"].each do |link|
      sum += link["click_count"].to_i
    end
    sum
  end
  
  def self.total_number_of_facebook_comments
    url = "http://api.facebook.com/restserver.php?method=links.getStats&urls="
    Stampeder.all.each do |s|
      url += "register.stampede10.com/with_friend/" + s.referral_code.to_s + ","
    end
    responce = HTTParty.get(url)
    sum = 0
    responce["links_getStats_response"]["link_stat"].each do |link|
      sum += link["comment_count"].to_i
    end
    sum
  end
  
  def self.total_number_of_facebook_likes
    url = "http://api.facebook.com/restserver.php?method=links.getStats&urls="
    Stampeder.all.each do |s|
      url += "register.stampede10.com/with_friend/" + s.referral_code.to_s + ","
    end
    responce = HTTParty.get(url)
    sum = 0
    responce["links_getStats_response"]["link_stat"].each do |link|
      sum += link["like_count"].to_i
    end
    sum
  end
  
  # def self.get_facebook_url
  #   temp = "http://api.facebook.com/restserver.php?method=links.getStats&urls="
  #   Stampeder.all.each do |s|
  #     temp += "register.stampede10.com/with_friend/" + s.referral_code.to_s + ","
  #   end
  #   temp
  # end
  
end