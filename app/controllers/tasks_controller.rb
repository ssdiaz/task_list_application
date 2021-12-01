class TasksController < ApplicationController
    
    get '/tasks' do  #show all tasks page -- need to make for account tho
        @tasks = Task.all
        @task = Task.find_by_id(params[:id])
        @items_completed = @tasks.count {|task| task.status == "Complete"}
        erb :'/tasks/index'
    end

    post '/tasks/new' do #making new task
        if !params["task"]["name"].empty?
            @task = Task.new(params[:task])
            @task.status = "Open"
            @task.save
        end
        redirect '/tasks'
    end

    patch '/tasks/:id' do #edit patch status -- need to do when ticked
        @task = Task.find_by_id(params[:id])
        @task.status = "Complete"
        @task.save
        redirect '/tasks'
    end


    delete '/tasks/:id' do #delete task
        @task = Task.find_by_id(params[:id])
        @task.delete
        redirect '/tasks'
    end




end