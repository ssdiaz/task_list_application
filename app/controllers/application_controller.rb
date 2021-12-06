require './config/environment'
require 'securerandom'

class ApplicationController < Sinatra::Base

  register Sinatra::Flash   #to use the Sinatra-Flash gem

  configure do
    #set :public_folder, 'public'
    set :views, Proc.new { File.join(root, "../views/") }     #set :views, 'app/views'
    enable :sessions
    set :session_secret, "7a93f0c56cbcadaffd4764a381b6074924e55a0add0b5c4b553e926a7af30fb7bcadca1ed9a7a447d7df753cca86b07ee28b9775ecdb4f68c17e9cd514d2b999" #puts SecureRandom.hex(64) => 7a93f0c56cbcadaffd4764a381b6074924e55a0add0b5c4b553e926a7af30fb7bcadca1ed9a7a447d7df753cca86b07ee28b9775ecdb4f68c17e9cd514d2b999
  end

  get '/' do
    if current_user #if current user is logged in, redirect to index if they try to access signup.login
      redirect to '/tasks'
    end
    erb :'welcome'
  end

  #invoking helpers method from Sinatra::Base    #and have access to session has w/o needing to pass in as an argument in this controller (that all others inherit from)
  helpers do
    def current_user #returns current user (obj) or nil, when user is logged in
      User.find_by_id(session[:user_id]) #OR User.find_by(id: session[:id])   #find_by will return nil or the user, find will throw an error
    end

    def redirect_if_not_logged_in #redirect view if user is NOT logged in. Use in like every controller method. 
      if !current_user 
        flash[:message] = "You must login to see this page."
        redirect '/'
      end
    end

    def check_user(task) #returns true if task user_id belongs to current user id. false if not.
      task.user == current_user #task.user_id == current_user.id 
    end

    def logged_in?#(session)  #returns true if userid is in the session hash
      !!session[:user_id]
    end

    def user_tasks
      current_user.tasks
    end
  end

end
