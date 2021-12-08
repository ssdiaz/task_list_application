class TasksController < ApplicationController

    get '/tasks' do  #all tasks page - for current user
        redirect_if_not_logged_in
        if current_user
            @user = current_user
            @tasks = user_tasks.select {|task| task.user_id == current_user.id}
            @items_completed = @tasks.count {|task| task.status == "Complete"}
            erb :'/tasks/index'
        end
    end

    post '/tasks/new' do #make a new task
        redirect_if_not_logged_in
        if current_user
            if  !params[:task][:name].empty? #validating if name is not empty
                task = Task.new(params[:task])
                task.status = "Open"
                task.user_id = session[:user_id]
                task.save
                flash[:message] = "Task Added."
            else
                flash[:message] = "Must add Task Name to create a new task."
            end
        end
        redirect to '/tasks'
    end

    patch '/tasks/:id' do #change status to complete
        redirect_if_not_logged_in
        if current_user
            task = user_tasks.find_by_id(params[:id])
            if check_user_for(task)
                task.status = "Complete"
                task.save
                flash[:message] = "Task Complete. Yay!"
            end
        end
        redirect to '/tasks'
    end

    delete '/tasks/:id' do #delete task
        redirect_if_not_logged_in
        task = user_tasks.find_by_id(params[:id])
        if check_user_for(task)
            task.delete
            flash[:message] = "Task Deleted."
        end
        redirect to '/tasks'
    end

    get '/:user_id/tasks' do  #all tasks page - for selected user
        redirect_if_not_logged_in
        if current_user && logged_in?
            @user = User.find_by_id(params[:user_id])
            @tasks = @user.tasks.select {|task| task.user_id == @user.id}
            @items_completed = @tasks.count {|task| task.status == "Complete"}
            erb :'/tasks/index'
        end
    end

end