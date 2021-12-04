class TasksController < ApplicationController

    get '/tasks' do  #show all tasks page
        redirect_if_not_logged_in
        @current_user = User.find_by_id(session[:user_id])
        if @current_user
            @tasks = user_tasks.select {|task| task.user_id == @current_user.id}
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
            end
        end
        redirect to '/tasks'
    end

    patch '/tasks/:id' do #edit patch status -- need to do when ticked
        redirect_if_not_logged_in
        if current_user
            task = user_tasks.find_by_id(params[:id])
            if check_user(task)
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
        if check_user(task)
            task.delete
            flash[:message] = "Task Deleted."
        end
        redirect to '/tasks'
    end

end