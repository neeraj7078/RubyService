
require 'sinatra'
require 'json'
require_relative 'DB/media_queries.rb'


post '/media/create', :provides=>:json do
 puts request.env["CONTENT_TYPE"]
 puts request.env["AUTHORIZATION"]
 body = request.body.read
 puts body

 mediaID = media_table_insert(body)
 status 200
 return mediaID
end

get '/medias', :provides=>:json do
 puts request.env["CONTENT_TYPE"]
 puts request.env["AUTHORIZATION"]

 media_rows = media_table_get_all()
 status 200
 return media_rows
end

get '/media/get/:mediaID', :provides=>:json do
 puts request.env["CONTENT_TYPE"]
 puts request.env["AUTHORIZATION"]

 puts "mediaID " + params[:mediaID]

 media = media_table_get(params[:mediaID])
 status 200
 return media
end


delete '/media/delete/:mediaID', :provides=>:json do
 puts request.env["CONTENT_TYPE"]
 puts request.env["AUTHORIZATION"]

 puts "mediaID " + params[:mediaID]

 media_table_delete(params[:mediaID])
 status 200
end


post '/media/update/:mediaID', :provides=>:json do
 puts request.env["CONTENT_TYPE"]
 puts request.env["AUTHORIZATION"]
 body = request.body.read
 puts body

 media_table_update(params[:mediaID], body)
 status 200
end


