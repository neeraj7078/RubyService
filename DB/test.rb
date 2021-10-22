require_relative 'projects_queries.rb'
require_relative 'media_queries.rb'

def project_insert_row()
string_length = 3
random_suffix = rand(36**string_length).to_s(36)
productionID = "productionID_" + random_suffix
name = "name_" + random_suffix
dcxID = "dcxID_" + random_suffix

insertBody = '{"productionID" : "' + productionID + '", "name" : "' + name + '", "dcxID" : "' + dcxID +'"}'

#puts "insertBody : " + insertBody
project_table_insert (insertBody)

return productionID
end

def media_insert_row(productionID)
string_length = 3
random_suffix = rand(36**string_length).to_s(36)
name = "media_" + random_suffix

insertBody = '{"productionID" : "' + productionID + '", "name" : "' + name + '"}'

#puts "insertBody : " + insertBody
return media_table_insert (insertBody)

end

project_table_get_all()

productionID = project_insert_row()

project_table_get(productionID)

project_table_get_all()

media_table_get_all()

mediaID = media_insert_row(productionID)

media_table_get(mediaID)

media_table_get_all()

media_table_delete(mediaID)

media_table_get(mediaID)

media_table_get_all()


project_table_delete(productionID)

project_table_get(productionID)

project_table_get_all()
