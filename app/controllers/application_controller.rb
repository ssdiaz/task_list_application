require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    #set :public_folder, 'public'
    enable :sessions
    #used: ruby -e "require 'securerandom'; puts SecureRandom.hex(64)"
    set :session_secret, "9bb3d88e3e0a5890bb979bf6b00451e5c858ed168307d6e194840f6ccfbab028d47db79e558e6bbfb8238ef0611c59e6836f85c52b11aae92e7c2987d57a8510"
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

end
