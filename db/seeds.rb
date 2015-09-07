# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create(:username => "csacollegepark", :email => "csacollegepark@gmail.com", :password =>'umdcsa1516')
Officer.create(:name => "Alice Liu", :role => "Co-President", :major => "Accounting & Finance", :grade => "Spring 2016/Winter 2016", :fun_fact => "I'm ambidextrous.", :name_id => "alice")
Officer.create(:name=>"Matthew Jiang", :role=>"Co-President", :major=>"Computer Science", :grade=>"Spring 2018", :fun_fact=>"One of my favorite hobbies is cooking.", :name_id=>"matt")
Officer.create(:name=>"Angela Kang", :role=>"VP Administration & Fundraising Chair", :major=>"Public Relations", :grade=>"Spring 2016", :fun_fact=>"I tend to end up on the weird parts of Youtube.", :name_id=>"angela")
Officer.create(:name=>"Sophia Peng", :role=>"VP Finance", :major=>"Accounting", :grade=>"Spring 2018", :fun_fact=>"I'm obsessed with Hong Kong music from the last century.", :name_id=>"sophia")
Officer.create(:name=>"Emily Liang", :role=>"VP External", :major=>"Physiology & Neurobiology", :grade=>"Winter 2015", :fun_fact=>"I'm a bubble tea connoisseur.", :name_id=>"emily")
Officer.create(:name=>"Valery Leng", :role=>"AO Representative", :major=>"Bioengineering", :grade=>"Spring 2016", :fun_fact=>"I have a huge stash of stuffed animals.", :name_id=>"valery")
Officer.create(:name=>"John Soong", :role=>"AO Representative", :major=>"Aerospace Engineering", :grade=>"Spring 2018", :fun_fact=>"I write satire pieces.", :name_id=>"john")
Officer.create(:name=>"Andrew Gu", :role=>"Webmaster", :major=>"Computer Engineering", :grade=>"Spring 2018", :fun_fact=>"I'm also known as Cali boy among the EBoard.", :name_id=>"andrew")
Officer.create(:name=>"Kevin Chan", :role=>"Historian", :major=>"Accounting & Supply Chain", :grade=>"Spring 2017", :fun_fact=>"I DJ.", :name_id=>"kevin")
Officer.create(:name=>"Vanney Huang", :role=>"Sports Chair", :major=>"Electrical Engineering", :grade=>"Fall 2016", :fun_fact=>"I'm scared of bugs.", :name_id=>"vanney")
