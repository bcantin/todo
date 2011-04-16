class Api::V2::ProjectsController < ApplicationController
  
  respond_to :json
  
  def index
     respond_with(@projects = Project.all)
  end
  
  def show
    @project = Project.find(params[:id])
    @tasks = @project.tasks
    respond_with([@project, @tasks])
  end
  
end