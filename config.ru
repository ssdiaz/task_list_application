require './config/environment'
require 'sinatra'

#to use PATCH, PUT, or DELETE requests / needs to be above the 'run ApplicationControler line'
use Rack::MethodOverride

#this loads the other controllers in the folder.
  use UsersController
  use TasksController
  #--alternative code below-- 
    # Dir[File.join(File.dirname(__FILE__), "app/controllers", "*.rb")].collect {|file| File.basename(file).split(".")[0] }.reject {|file| file == "application_controller" }.each do |file|
    #   string_class_name = file.split('_').collect { |w| w.capitalize }.join
    #   class_name = Object.const_get(string_class_name)
    #   use class_name
    # end

#this runs our app 
run ApplicationController


