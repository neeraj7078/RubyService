
# server.rb
require 'sinatra'

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

post '/medias' do
  puts request.env["CONTENT_TYPE"]
  puts request.body.read
  status 200
  return 'Create a media'
end

