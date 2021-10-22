require 'mysql2'
require 'json'
require_relative 'common.rb'
require 'securerandom'

def project_table_insert (inputData)

puts "table_insert::start"

puts "inputData " + inputData

inputJson = JSON.parse(inputData)

client = get_mysql_client();

puts "parsed input : " + inputJson.to_s
projectID = SecureRandom.uuid

insertQuery = "INSERT INTO cms_database.PROJECTS VALUES ('#{projectID}', '#{inputJson['name']}', '#{inputJson['productionID']}', '#{inputJson['dcxID']}' );"
puts "insertQuery " + insertQuery

client.query(insertQuery);
puts "table_insert::end"
return projectID
end

def project_table_delete (productionID)

puts "table_delete::start"

puts "productionID " + productionID


client = get_mysql_client();

deleteQuery = "DELETE FROM cms_database.PROJECTS WHERE `productionID` = '#{productionID}';"
puts "deleteQuery " + deleteQuery

client.query(deleteQuery);
puts "table_delete::end"
end


def project_table_get_all()
puts "table_get_all::start"

client = get_mysql_client();
selectQuery = "select * from cms_database.PROJECTS;"
puts "selectQuery " + selectQuery

results = client.query(selectQuery);
results.each do |row|
puts row
end

puts "table_get_all::end"
return results
end

def project_table_get(productionID)
puts "table_get::start"
puts "productionID " + productionID

client = get_mysql_client();
selectQuery = "select * from cms_database.PROJECTS WHERE `productionID` = '#{productionID}';"
puts "selectQuery " + selectQuery

results = client.query(selectQuery);
results.each do |row|
puts row
end

puts "table_get::end"
return results
end

