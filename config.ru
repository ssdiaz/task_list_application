require './config/environment'
require 'sinatra'

use Rack::MethodOverride

use UsersController
use TasksController

run ApplicationController


