class TasksController < ApplicationController
    
    get '/tasks' do 
        @tasks = Task.all
        erb :'/tasks/index'
    end

    post '/tasks/new' do
        if !params["task"]["name"].empty?
            @task = Task.create(params[:task])
        end

        redirect '/tasks'
    end

    delete '/tasks/:id' do
        @task = Task.find_by_id(params[:id])
        @task.delete
        redirect '/tasks'
    end






end