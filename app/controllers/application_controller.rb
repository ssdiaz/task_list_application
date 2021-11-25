require './config/environment'
require 'securerandom'

class ApplicationController < Sinatra::Base

  configure do
    #set :public_folder, 'public'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }     #used: ruby -e "require 'securerandom'; puts SecureRandom.hex(64)"
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

end
