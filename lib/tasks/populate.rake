namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    teamNames = ['Red', 'Green', 'Blue', 'Yellow']
    barcodes = ('1000'..'9999').to_a
    [Team, Stampeder, School, Church].each(&:delete_all)
    t = Time.now
    School.populate 35 do |school|
      school.name = Populator.words(1..3).titleize
    end
    
    puts "Schools created in #{Time.now - t}"
    t = Time.now
    
    Church.populate 10 do |church|
      church.name = Populator.words(1..4).titleize
    end
    
    puts "Churches created in #{Time.now - t}"
    t = Time.now
    
    Team.populate 4 do |team|
      team.name = teamNames
      teamNames -= team.name.to_a
    end
    
    puts "Teams created in #{Time.now - t}"
    t = Time.now
    
    Stampeder.populate 800 do |stampeder|
      stampeder.firstname = Faker::Name.first_name
      stampeder.lastname = Faker::Name.last_name
      stampeder.fullname = "#{stampeder.firstname} #{stampeder.lastname}"
      stampeder.barcode = barcodes[rand(9000)]
      barcodes -= stampeder.barcode.to_a
      stampeder.parentphone = Faker::PhoneNumber.phone_number
      stampeder.studentphone = Faker::PhoneNumber.phone_number
      stampeder.address = Faker::Address.street_address
      stampeder.grade = [6,7,8,9]
      stampeder.city = Faker::Address.city
      stampeder.state = Faker::Address.us_state_abbr
      stampeder.zipcode = Faker::Address.zip_code
      stampeder.gender = ["m", "f"]
      stampeder.dob = 8.years.ago.to_date..3.years.ago.to_date
      stampeder.parent = Faker::Name.name
      stampeder.textmsg = [true,false]
      stampeder.email = Faker::Internet.email
      stampeder.parentemail = Faker::Internet.email
      stampeder.friend_id = [Stampeder.all[rand(Stampeder.all.size)].id, nil, Stampeder.all[rand(Stampeder.all.size)].id, nil, nil]
      stampeder.school_id = School.all[rand(School.all.size)].id
      stampeder.church_id = Church.all[rand(Church.all.size)].id
      stampeder.notes = Faker::Lorem.paragraph
      stampeder.online_signup = false
    end
    
    puts "Stampeders created in #{Time.now - t}"
    t = Time.now
    
    Stampeder.all.each do |stampeder|
      stampeder.createSubgroup
      stampeder.pickTeam
      stampeder.save
    end
    
    puts "Stampeders' teams picked in #{Time.now - t}"
    
  end
  
  task :populate_schools => :environment do
    School.delete_all
    School.create([{:name => "McLean Middle School (MMS)"},{:name => "Fort Worth Country Day (FWCDS)"},{:name => "North Richland Middle School (NRMS)"},{:name => "Morningside Middle School (MMS)"},{:name => "Wedgwood Middle School (WMS)"},{:name => "Meadowbrook Middle School (MMS)"},{:name => "Riverside Middle School (RMS)"},{:name => "Hillwood Middle School (HMS)"},{:name => "Daggett Montessori School (DMS)"},{:name => "Montessori Childrens House (MCH)"},{:name => "Southwest Christian School (SCS)"},{:name => "Crowley Middle School (CMS)"},{:name => "Rosemont Middle School (RMS)"},{:name => "All Saints' Episcopal School (ASES)"},{:name => "Kirkpatrick Middle School (KMS)"},{:name => "Brewer Middle School (BMS)"},{:name => "Lake Country Christian School (LCCS)"},{:name => "Nolan Catholic High School (NCHS)"},{:name => "North Crowley High School (NCHS)"},{:name => "Arlington Heights High School (AHHS)"},{:name => "Fort Worth Academey Of Fine Arts (FWAFA)"},{:name => "Fort Worth Academey (FWA)"},{:name => "Paschal High School (PHS)"},{:name => "Trinity Valley School (TVS)"},{:name => "Trinity Christian Academey (TCA)"}])
  end
  
  task :populate_churches => :environment do
    Church.delete_all
    Church.create([{:name => "Wedgwood Baptist Church (WBC)"},{:name => "First United Methodist Church of Ft. Worth"},{:name => "St. Patrick Cathedral"},{:name => "Broadway Baptist Church (BBC)"},{:name => "First Presbyterian Church Of Ft. Worth"},{:name => "Christ Chapel Bible Church"},{:name => "St. Stephen Presbyterian Church"},{:name => "Irving Bible Church"}])
  end
end