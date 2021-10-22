
require 'mysql2'

def get_mysql_client ()
return Mysql2::Client.new( :host => "10.42.76.92", :port => "3306",  :username => "cms", :password => "cmscms")
end



