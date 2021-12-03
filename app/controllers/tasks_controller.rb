class TasksController < ApplicationController
    
    get '/tasks/index' do  #show all tasks page -- need to make for account only tho. session:id is not reading. its nil
       # redirect_if_not_logged_in
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
        redirect_if_not_logged_in
        if  !params["task"]["name"].empty? 
            @task = Task.new(params[:task])
            @task.status = "Open"
            @task.user_id = session[:user_id]
            @task.save
        end
        redirect '/tasks/index'
    end

    patch '/tasks/:id' do #edit patch status -- need to do when ticked
        redirect_if_not_logged_in
        task = Task.find_by_id(params[:id])
        if check_user(task)
            task.status = "Complete"
            task.save
        end
        redirect '/tasks/index'

        # redirect_if_not_logged_in
        # @task = Task.find_by(id: params[:id])
        # if check_user(@task)
        #     @task.update(params[:task])
        # end
        # redirect '/tasks/index' #erb :'task/show'
    end

    delete '/tasks/:id' do #delete task
        redirect_if_not_logged_in
        task = Task.find_by_id(params[:id])
        if check_user(task)
            task.delete
        end

        redirect '/tasks/index'
    end

end