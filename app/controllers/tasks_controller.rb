class TasksController < ApplicationController
  
  before_filter :get_project
  
  respond_to :html, :js
  
  def create
    @task   = @project.tasks.new(params[:task])
    
    if @task.save
      flash[:notice] = 'Task Created'
    else
      flash[:error] = 'Task Not Created'
    end
    redirect_to @project
  end
  
  def complete
    @task = @project.tasks.find(params[:id])
    
    @task.completed = true
    @task.save
    flash[:notice] = 'Task Completed'
    redirect_to @project
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    if @task
      Task.destroy(@task)
      flash[:notice] = 'Task Destroyed'
    end
    redirect_to @project
  end
  
end
