require 'securerandom'

class ApplicationController < Sinatra::Base
  register Sinatra::Flash  

  configure do
    set :views, 'app/views'
    set :public_folder, 'public'
    enable :sessions
    set :session_secret, "7a93f0c56cbcadaffd4764a381b6074924e55a0add0b5c4b553e926a7af30fb7bcadca1ed9a7a447d7df753cca86b07ee28b9775ecdb4f68c17e9cd514d2b999" #puts SecureRandom.hex(64) => 7a93f0c56cbcadaffd4764a381b6074924e55a0add0b5c4b553e926a7af30fb7bcadca1ed9a7a447d7df753cca86b07ee28b9775ecdb4f68c17e9cd514d2b999
  end

  get '/' do
    if current_user 
      redirect to '/tasks'
    end
    erb :'welcome'
  end

  helpers do
    def current_user #returns current user (obj) or nil, when user is logged in
      User.find_by_id(session[:user_id])
    end

    def logged_in? #returns true if userid is in the session hash
      !!session[:user_id]
    end

    def redirect_if_not_logged_in #redirect view if user is NOT logged in. Use in like every controller method. 
      if !logged_in?
        flash[:message] = "You must login to see this page."
        redirect '/'
      end
    end

    def check_user_for(task) #returns true if task user_id belongs to current user id. false if not.
      task.user == current_user #task.user_id == current_user.id 
    end

    def user_tasks
      current_user.tasks
    end
  end

end
