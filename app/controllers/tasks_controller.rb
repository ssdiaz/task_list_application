class TasksController < ApplicationController
    
    get '/tasks/index' do  #show all tasks page -- need to make for account only tho. session:id is not reading. its nil
        @current_user = User.find_by_id(session[:user_id])

        if @current_user #is true
            @tasks = Task.select {|task| task.user_id == @current_user.id}
            @items_completed = @tasks.count {|task| task.status == "Complete"}
            erb :'/tasks/index'
        else
            erb :error
        end
    end

    post '/tasks/new' do #make a new task
        if !params["task"]["name"].empty?
            @task = Task.new(params[:task])
            @task.status = "Open"
            @task.user_id = session[:user_id]
            @task.save
        end
        redirect '/tasks/index'
    end

    patch '/tasks/:id' do #edit patch status -- need to do when ticked
        @task = Task.find_by_id(params[:id])
        @task.status = "Complete"
        @task.save
        redirect '/tasks/index'
    end

    delete '/tasks/:id' do #delete task
        @task = Task.find_by_id(params[:id])
        @task.delete
        redirect '/tasks/index'
    end

end