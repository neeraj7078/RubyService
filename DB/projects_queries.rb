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

def project_table_delete_projectID (projectID)

puts "table_delete::start"

puts "projectID " + projectID


client = get_mysql_client();

deleteQuery = "DELETE FROM cms_database.PROJECTS WHERE `ID` = '#{projectID}';"
puts "deleteQuery " + deleteQuery

client.query(deleteQuery);
puts "table_delete::end"
end

def project_table_delete_productionID (productionID)

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

def project_table_get_projectID(projectID)
puts "table_get::start"
puts "projectID " + projectID

client = get_mysql_client();
selectQuery = "select * from cms_database.PROJECTS WHERE `ID` = '#{projectID}';"
puts "selectQuery " + selectQuery

results = client.query(selectQuery);
results.each do |row|
puts row
end

puts "table_get::end"
return results
end

def project_table_get_productionID(productionID)
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

def project_table_update_projectID (projectID, inputData)

puts "table_update::start"

puts "projectID " + projectID
puts "inputData " + inputData


client = get_mysql_client();

inputJson = JSON.parse(inputData)
puts "parsed input : " + inputJson.to_s

updateQuery = "UPDATE cms_database.PROJECTS SET `name` = '#{inputJson['name']}', `dcxID`= '#{inputJson['dcxID']}' WHERE `ID` = '#{projectID}';"
puts "updateQuery " + updateQuery

client.query(updateQuery);
puts "table_update::end"
end

def project_table_update_productionID (productionID, inputData)

puts "table_update::start"

puts "productionID " + productionID
puts "inputData " + inputData


client = get_mysql_client();

inputJson = JSON.parse(inputData)
puts "parsed input : " + inputJson.to_s

updateQuery = "UPDATE cms_database.PROJECTS SET `name` = '#{inputJson['name']}', `dcxID`= '#{inputJson['dcxID']}' WHERE `productionID` = '#{productionID}';"
puts "updateQuery " + updateQuery

client.query(updateQuery);
puts "table_update::end"
end


