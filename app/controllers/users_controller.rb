class UsersController < ApplicationController
  
  get '/signup' do
    if current_user #if current user is logged in, redirect to index if they try to access signup.login
      redirect '/tasks/index'
    end
    erb :'/signup'
  end

  post '/signup' do
    user = User.create(params[:user])
    if user.valid?
      session[:user_id] = user.id
      redirect to '/tasks/index'
    else
      flash[:message] = user.errors.full_messages
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
     user = User.find_by(email: params[:email])
      if user != nil && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect to '/tasks/index'
      end 
      flash[:message] = "Invalid credentials. Please try again."
      redirect '/login'
  end

  get '/account' do  #get "#{@user.name}/account" do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
      erb :'/users/account'
    else
      erb :'/error'
    end
  end

  patch '/account' do
    if current_user
      current_user.update(params[:user])
      flash[:message] = "Success. Information saved." unless !current_user.save
    end
    redirect to '/account'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end