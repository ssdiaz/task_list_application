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

  get '/signup' do
    erb :'/signup'
  end

  post '/signup' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id
    #redirect '/users/home'
    redirect '/account'
  end


  get '/login' do 
    erb :'login'
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to "/account"
    end
    # erb :'error'
  end

  get '/account' do
    @current_user = User.find_by(session[:user_id])
    if @current_user
      erb :'/account'
    else
      erb :'/error'
    end
  end


  get '/logout' do
    session.clear
    redirect '/'
  end


end
