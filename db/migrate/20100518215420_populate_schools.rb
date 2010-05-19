class PopulateSchools < ActiveRecord::Migration
  def self.up
    School.create([{:name => "McLean Middle School"},{:name => "Fort Worth Country Day"},{:name => "North Richland Middle School"},{:name => "Morningside Middle School"},{:name => "Wedgwood Middle School"},{:name => "Meadowbrook Middle School"},{:name => "Riverside Middle School"},{:name => "Hillwood Middle School"},{:name => "Daggett Montessori School"},{:name => "Montessori Childrens House"},{:name => "Southwest Christian School"},{:name => "Crowley Middle School"},{:name => "Rosemont Middle School"},{:name => "All Saints' Episcopal School"},{:name => "Kirkpatrick Middle School"},{:name => "Brewer Middle School"},{:name => "Lake Country Christian School"},{:name => "Nolan Catholic High School"},{:name => "North Crowley High School"},{:name => "Arlington Heights High School"},{:name => "Fort Worth Academey Of Fine Arts"},{:name => "Fort Worth Academey"}])
  end

  def self.down
    School.destroy_all([{:name => "McLean Middle School"},{:name => "Fort Worth Country Day"},{:name => "North Richland Middle School"},{:name => "Morningside Middle School"},{:name => "Wedgwood Middle School"},{:name => "Meadowbrook Middle School"},{:name => "Riverside Middle School"},{:name => "Hillwood Middle School"},{:name => "Daggett Montessori School"},{:name => "Montessori Childrens House"},{:name => "Southwest Christian School"},{:name => "Crowley Middle School"},{:name => "Rosemont Middle School"},{:name => "All Saints' Episcopal School"},{:name => "Kirkpatrick Middle School"},{:name => "Brewer Middle School"},{:name => "Lake Country Christian School"},{:name => "Nolan Catholic High School"},{:name => "Paschal High School"},{:name => "North Crowley High School"},{:name => "Arlington Heights High School"},{:name => "Fort Worth Academey Of Fine Arts"},{:name => "Fort Worth Academey"}])
  end
end

# {:name => "Paschal High School"},{:name => "Trinity Valley School"},{:name => "Trinity Christian Academy"},