class TasksController < ApplicationController
    
    get '/tasks' do 
        @tasks = Task.all
        erb :'/tasks/index'
    end

    get '/tasks/new' do 
    end

    post '/tasks/new' do
        @task = Task.create(params[:task])
        redirect '/tasks'
    end






end