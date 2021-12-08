#We require access to the ‘./config/environment’ file since that’s where our database connection is loaded
require_relative './config/environment'
require 'sinatra/activerecord/rake'

#allows our class and database to interact without having to run whole program
task :console do
  Pry.start
end