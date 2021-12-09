require './config/environment'
require 'sinatra'
require 'sysrandom/securerandom'

use Rack::MethodOverride

use UsersController
use TasksController

run ApplicationController


