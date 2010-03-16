class Stampeder < ActiveRecord::Base
  belongs_to :team
  
  validates_presence_of :firstname, :lastname, :grade, :gender
  #validates_inclusion_of :barcode, :in => 111111111..999999999, :message => 'invalid barcode'
  validates_format_of :parentphone, :with => /\d{10}/
  
  def pickTeam
    teams = Team.find(:all)
    
    
  end
  
  def createSubgroup
    self.subgroup = self.grade.to_s + self.gender.to_s
  end
  
end
