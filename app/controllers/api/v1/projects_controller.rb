class Api::V1::ProjectsController < ApplicationController
  
  respond_to :json
  
  def index
     respond_with(@projects = Project.all)
  end
  
  def show
    @project = Project.find(params[:id])
    @incomplete_tasks = @project.tasks.sorted.incomplete
    @incomplete_tasks  = @project.tasks.completed.order('updated_at DESC')
    respond_with([@project, @incomplete_tasks, @incomplete_tasks])
  end
  
end