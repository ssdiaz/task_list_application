# this tells your app in what order to load the files - order matters here
# file helps set up active record

#install our gems first:
require 'bundler/setup'
#loads the bundle of gems (put before it loads our program)
Bundler.require(:default) 

#connects ActiveRecord to our database; 
#tells ActiveRecord where to find the database and establishes connection
#ActiveBaRecord::Base keeps the established connection stored as a class variable at ActiveRecord::Base.connection
ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/task_app.sqlite"
)

# loads all our app content - MVC
require_all 'app'


