require 'bundler/setup'
Bundler.require(:default) 

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/database.sqlite"
)

require_all 'app'
