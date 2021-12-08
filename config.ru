#Rack based file (.ru)
#config.ru details to Rack the environment requirements of the application and this file STARTS our app

# loads our enviroment file (below), code and library. Also loads our application server (using rackup or shotgun)
require './config/environment'
require 'sinatra' #this file runs our Sinatra library of methods

#to use PATCH, PUT, or DELETE requests / needs to be above the 'run ApplicationControler line'
#Sinatra uses Rack for it's middleware - connection b/w (our Ruby) app and server
use Rack::MethodOverride

#this loads the other controllers in the folder.
  use UsersController
  use TasksController

#this runs our app by specifiying which controller to load as part of our app
  #'run' is the mounting method; 'ApplicationController'is the class that inherits from Sinatra::Base
  #this will create an instance of our ApplicationController class that can repsond to requests from a client
run ApplicationController


