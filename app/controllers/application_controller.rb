require './config/environment'
require 'securerandom'

class ApplicationController < Sinatra::Base

  configure do
    #set :public_folder, 'public'
    enable :sessions
    set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) } #used: ruby -e "require 'securerandom'; puts SecureRandom.hex(64)"
    set :views, Proc.new { File.join(root, "../views/") }     #set :views, 'app/views'
  end

  get '/' do
    erb :'welcome'
  end

  get '/login' do 
    erb :'login'
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      #redirect to "/account"
    end
    # erb :'error'
  end

  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
      erb :'/user/account'
    else
      erb :'error'
    end
  end


  # get '/users/signup' do
  #   erb :'/users/signup'
  # end




end
