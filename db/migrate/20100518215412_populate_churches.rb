class PopulateChurches < ActiveRecord::Migration
  def self.up
    Church.create([{:name => "Wedgwood Baptist Church"},{:name => "First United Methodist Church of Ft. Worth"},{:name => "St. Patrick Cathedral"},{:name => "Broadway Baptist Church"},{:name => "First Presbyterian Church Of Ft. Worth"},{:name => "Christ Chapel Bible Church"},{:name => "St. Stephen Presbyterian Church"},{:name => "Irving Bible Church"}])
  end

  def self.down
    Church.destroy_all([{:name => "McKinney Memorial Bible Church"},{:name => "Southcliff Baptist Church"},{:name => "Wedgwood Baptist Church"},{:name => "First United Methodist Church of Ft. Worth"},{:name => "St. Patrick Cathedral"},{:name => "Broadway Baptist Church"},{:name => "First Presbyterian Church Of Ft. Worth"},{:name => "Christ Chapel Bible Church"},{:name => "St. Stephen Presbyterian Church"},{:name => "Irving Bible Church"}])
  end
end

# {:name => "McKinney Memorial Bible Church"},{:name => "Southcliff Baptist Church"},