require 'mysql2'
require 'json'
require_relative 'common.rb'
require 'securerandom'

def media_table_insert (inputData)

puts "table_insert::start"

puts "inputData " + inputData

inputJson = JSON.parse(inputData)

client = get_mysql_client();

puts "parsed input : " + inputJson.to_s

mediaID = SecureRandom.uuid

insertQuery = "INSERT INTO cms_database.MEDIAS VALUES ('#{mediaID}', '#{inputJson['name']}', '#{inputJson['productionID']}');"

puts "insertQuery " + insertQuery

client.query(insertQuery);
puts "table_insert::end"
return mediaID
end

def media_table_delete (mediaID)

puts "table_delete::start"

puts "mediaID " + mediaID


client = get_mysql_client();

deleteQuery = "DELETE FROM cms_database.MEDIAS WHERE `ID` = '#{mediaID}';"
puts "deleteQuery " + deleteQuery

client.query(deleteQuery);
puts "table_delete::end"
end

def media_table_get_all()
puts "table_get_all::start"

client = get_mysql_client();
selectQuery = "select * from cms_database.MEDIAS;"
puts "selectQuery " + selectQuery

results = client.query(selectQuery);
results.each do |row|
puts row
end

puts "table_get_all::end"
return results
end

def media_table_get(mediaID)
puts "table_get::start"
puts "mediaID " + mediaID

client = get_mysql_client();
selectQuery = "select * from cms_database.MEDIAS WHERE `ID` = '#{mediaID}';"
puts "selectQuery " + selectQuery

results = client.query(selectQuery);
results.each do |row|
puts row
end

puts "table_get::end"
return results
end

def media_table_update (mediaID, inputData)

puts "table_update::start"

puts "mediaID " + mediaID
puts "inputData " + inputData


client = get_mysql_client();

inputJson = JSON.parse(inputData)
puts "parsed input : " + inputJson.to_s

updateQuery = "UPDATE cms_database.MEDIAS SET `name` = '#{inputJson['name']}', `productionID`= '#{inputJson['productionID']}' WHERE `ID` = '#{mediaID}';"
puts "updateQuery " + updateQuery

client.query(updateQuery);
puts "table_update::end"
end


