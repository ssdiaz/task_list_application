require './config/environment'
require 'sinatra'

#to use PATCH, PUT, or DELETE requests / needs to be above the 'run ApplicationControler line'
use Rack::MethodOverride
#code below is to load the other controllers in the folder.
  # use UsersController
  # run TasksController
Dir[File.join(File.dirname(__FILE__), "app/controllers", "*.rb")].collect {|file| File.basename(file).split(".")[0] }.reject {|file| file == "application_controller" }.each do |file|
  string_class_name = file.split('_').collect { |w| w.capitalize }.join
  class_name = Object.const_get(string_class_name)
  use class_name
end

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

run ApplicationController

#file actually runs our app 
