ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

#connects ActiveRecord to our database
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)


require_all 'app'
# require './app/controllers/application_controller'
# require_all './app/controllers'
# require_all './app/views/users'