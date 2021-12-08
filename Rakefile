#We require access to the ‘./config/environment’ file since that’s where our database connection is loaded
require_relative './config/environment' #loads our environment
#needed for sinatra-activerecord gem
require 'sinatra/activerecord/rake' #to get Rake tasks from the Sinatra-activerecord gem

#allows our class and database to interact without having to run whole program
task :console do
  Pry.start
end