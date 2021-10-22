
# server.rb
require 'sinatra'
require 'json'
require_relative 'DB/projects_queries.rb'
require_relative 'DB/media_queries.rb'
require 'uri'

get '/' do
  status 200
  body 'Welcome to RubyService!'
end

get '/media' do
  status 300
  body 'Welcome to RubyService media!'
end

get '/media/:id' do
  status 400
  body 'Welcome to RubyService media ' + params[:id]
end

#accepts jason -- look how it is done
post '/medias', :provides=>:json do
  puts request.env["CONTENT_TYPE"]
  puts request.body.read
  status 200
  return 'Create a media'
end


post '/project/create', :provides=>:json do
 puts request.env["CONTENT_TYPE"]
 puts request.env["AUTHORIZATION"]
 body = request.body.read
 puts body

 projectID = project_table_insert(body)
 status 200
 return projectID
end

get '/projects', :provides=>:json do
 puts request.env["CONTENT_TYPE"]
 puts request.env["AUTHORIZATION"]

 project_rows = project_table_get_all()
 status 200
 return project_rows
end

get '/project/get/:projectID', :provides=>:json do
 puts request.env["CONTENT_TYPE"]
 puts request.env["AUTHORIZATION"]

 puts "projectID " + params[:projectID]

 project = project_table_get_projectID(params[:projectID])
 status 200
 return project
end

get '/project/get', :provides=>:json do
 puts request.env["CONTENT_TYPE"]
 puts request.env["AUTHORIZATION"]

 if params.has_key?("projectID")
 puts "projectID " + params["projectID"]
 project = project_table_get_projectID(params["projectID"])
 status 200
 return project
 end

 if params.has_key?("productionID")
 puts "productionID " + params["productionID"]
 project = project_table_get_productionID(params["productionID"])
 status 200
 return project
 end

 status 500
end

delete '/project/delete/:projectID', :provides=>:json do
 puts request.env["CONTENT_TYPE"]
 puts request.env["AUTHORIZATION"]

 puts "projectID " + params[:projectID]

 project_table_delete_projectID(params[:projectID])
 status 200
end

post '/project/update/:projectID', :provides=>:json do
 puts request.env["CONTENT_TYPE"]
 puts request.env["AUTHORIZATION"]
 body = request.body.read
 puts body

 project_table_update_projectID(params[:projectID], body)
 status 200
end

