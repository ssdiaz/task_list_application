class UsersController < ApplicationController

  get '/signup' do
    if current_user 
      redirect '/tasks'
    end
    erb :'/users/signup'
  end

  post '/signup' do
    user = User.create(params[:user])
    if user.valid?
      session[:user_id] = user.id
      redirect to '/tasks'
    else
      flash[:message] = user.errors.full_messages
      redirect to '/signup'
    end
  end

  get '/login' do 
    if current_user 
      redirect to '/tasks'
    end
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by(email: params[:email])
    if user != nil && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/tasks'
    end 
      flash[:message] = "Invalid credentials. Please try again."
      redirect to '/login'
  end

  get '/account' do  
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
      erb :'/users/account'
    else
      session.clear
      flash[:message] = "Please login to view your account."
      erb :'/users/login'
    end
  end

  patch '/account' do
    if current_user
      current_user.update(params[:user])
      flash[:message] = "Success. Profile saved." unless !current_user.save
    end
    redirect to '/account'
  end

  get '/community' do
    redirect_if_not_logged_in

    if current_user && logged_in?
      @users = User.all
    end
    erb :'/users/index'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end