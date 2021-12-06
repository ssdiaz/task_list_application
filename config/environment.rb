# ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
# Bundler.require(:default, ENV['SINATRA_ENV'])
Bundler.require(:default) #, ENV['SINATRA_ENV'])

#connects ActiveRecord to our database
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/task_app.sqlite"
)

require_all 'app'


#helps set up active record