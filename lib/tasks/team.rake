namespace :initialize do
  task :teams => :environment do
    Team.create([{:name => "Red"},{:name => "Green"},{:name => "Blue"},{:name => "Yellow"}])
  end
  
  task :signup_periods => :environment do
    Day.create
  end
  
  task :schools => :environment do
    School.create([{:name => "McLean Middle School (MMS)"},{:name => "Fort Worth Country Day (FWCDS)"},{:name => "North Richland Middle School (NRMS)"},{:name => "Morningside Middle School (MMS)"},{:name => "Wedgwood Middle School (WMS)"},{:name => "Meadowbrook Middle School (MMS)"},{:name => "Riverside Middle School (RMS)"},{:name => "Hillwood Middle School (HMS)"},{:name => "Daggett Montessori School (DMS)"},{:name => "Montessori Childrens House (MCH)"},{:name => "Southwest Christian School (SCS)"},{:name => "Crowley Middle School (CMS)"},{:name => "Rosemont Middle School (RMS)"},{:name => "All Saints' Episcopal School (ASES)"},{:name => "Kirkpatrick Middle School (KMS)"},{:name => "Brewer Middle School (BMS)"},{:name => "Lake Country Christian School (LCCS)"},{:name => "Nolan Catholic High School (NCHS)"},{:name => "North Crowley High School (NCHS)"},{:name => "Arlington Heights High School (AHHS)"},{:name => "Fort Worth Academey Of Fine Arts (FWAFA)"},{:name => "Fort Worth Academey (FWA)"},{:name => "Paschal High School (PHS)"},{:name => "Trinity Valley School (TVS)"},{:name => "Trinity Christian Academey (TCA)"},{:name => "Homeschool"}])
  end
  
  task :churches => :environment do
    Church.create([{:name => "Wedgwood Baptist Church (WBC)"},{:name => "First United Methodist Church of Ft. Worth"},{:name => "St. Patrick Cathedral"},{:name => "Broadway Baptist Church (BBC)"},{:name => "First Presbyterian Church Of Ft. Worth"},{:name => "Christ Chapel Bible Church"},{:name => "St. Stephen Presbyterian Church"},{:name => "Irving Bible Church"},{:name => "Travis Avenue Baptist"},{:name => "Trinity Chapel Bible Church"}])
  end
  
  task :all => [:teams, :signup_periods, :schools, :churches]
end