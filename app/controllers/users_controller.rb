class UsersController < ApplicationController
  
  get '/account' do  #get "#{@user.name}/account" do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
      erb :'/users/account'
    else
      erb :'/error'
    end
  end

  patch '/account' do
    @user = User.find_by_id(session[:user_id])
    # @user.update(params[:name])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.save
    redirect to '/account'
  end
  
end