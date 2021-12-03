require './config/environment'
require 'securerandom'

class ApplicationController < Sinatra::Base

  register Sinatra::Flash #to use the Sinatra-Flash gem

  configure do
    #set :public_folder, 'public'
    set :views, Proc.new { File.join(root, "../views/") }     #set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    #set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }
    #set :session_secret, SecureRandom.hex(64)
  end

  get '/' do
    erb :'welcome'
  end

  get '/signup' do
    if current_user #if current user is logged in, redirect to index if they try to access signup.login
      redirect '/tasks/index'
    end

    erb :'/signup'
  end

  post '/signup' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id
    redirect to '/tasks/index'
  end

  get '/login' do 
    if current_user #if current user is logged in, redirect to index if they try to access signup.login
      redirect '/tasks/index'
    end
    erb :'login'
  end

  post '/login' do
      user = User.find_by(email: params[:email])     # user = User.find_by(email: params["email"], password: params["password"])
      if user != nil && user.password == params[:password]
        session[:user_id] = user.id
        redirect to '/tasks/index'
      end 
      flash[:message] = "Invalid credentials. Please try again."
      redirect '/login'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


  #invoking helpers method from Sinatra::Base
    #and have access to session has w/o needing to pass in as an argument in this controller (that all others inherit from)

  helpers do
    
    def current_user #returns current user ID or nil, when user is logged in
      User.find_by_id(session[:user_id]) #OR User.find_by(id: session[:id])    #find_by will return nil or the user, find will throw an error
    end

  end






end
