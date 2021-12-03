require './config/environment'
require 'securerandom'

class ApplicationController < Sinatra::Base

  register Sinatra::Flash #to use the Sinatra-Flash gem

  configure do
    #set :public_folder, 'public'
    set :views, Proc.new { File.join(root, "../views/") }     #set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret" #for shotgun really.- this is so sinatra isn't sending a set cookie header with every click
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
    # @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    # @user.save
    # user = User.create(name: params["name"], email: params["email"], password: params["password"]).valid?
    # session[:user_id] = user.id
    # redirect to '/tasks/index'

    
    user = User.create(params)
    if user.valid?
      session[:user_id] = user.id
      redirect to '/tasks/index'
    else
      flash[:message] = user.errors.full_messages.each {|message| puts message}
      redirect to '/signup'
    end


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
    
    def current_user #returns current user (obj) or nil, when user is logged in
      User.find_by_id(session[:user_id]) #OR User.find_by(id: session[:id])   #find_by will return nil or the user, find will throw an error
    end

    def redirect_if_not_logged_in #redirect view if user is NOT logged in. Use in like every controller method. 
      if !current_user 
        #flash[:message] = "You must login to see this page." #-- NEED TO ADD INTO THE VIEWS THO...
        redirect '/login'
      end
    end

    def check_user(task) #returns true if task user_id belongs to current user id. false if not.
      task.user == current_user #task.user_id == current_user.id 
    end

    def logged_in?#(session)  #returns true if userid is in the session hash
      !!session[:user_id]
    end

  end






end
