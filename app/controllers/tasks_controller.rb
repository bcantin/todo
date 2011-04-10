class TasksController < ApplicationController
  
  before_filter :get_project
  
  respond_to :html, :js
  
  def create
    # render :text => params.inspect
    @task = @project.tasks.new(params[:task])
    @task.save
    respond_with(@task, :layout => !request.xhr? )
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
  
  def sort
    @project.tasks.incomplete.each do |task|
      task.update_attribute(:position, params['task'].index(task.id.to_s) + 1)
    end
    render :nothing => true
  end
  
end
