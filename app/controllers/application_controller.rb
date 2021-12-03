require './config/environment'
require 'securerandom'

class ApplicationController < Sinatra::Base

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
    erb :'/signup'
  end

  post '/signup' do
    @user = User.new(name: params["name"], email: params["email"], password: params["password"])
    @user.save
    session[:user_id] = @user.id
    redirect to '/tasks/index'
  end

  get '/login' do 
    erb :'login'
  end

  post '/login' do
      @user = User.find_by(email: params["email"], password: params["password"])
      if @user != nil && @user.password == params[:password]
          session[:user_id] = @user.id
          redirect to '/tasks/index'
      end
      redirect '/login'
  end



get '/logout' do
  session.clear
  redirect '/'
end

helpers do
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end
end




end
