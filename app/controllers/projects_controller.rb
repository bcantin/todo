class ProjectsController < ApplicationController
  
  respond_to :html, :js
  
  def index
    respond_with(@projects = Project.all)
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = 'Project Created'
      respond_with(@project, :location => @project)
    else
      render :new
    end
  end
  
  def show
    @project = Project.find(params[:id])
    @task = @project.tasks.new
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      flash[:notice] = 'Project Updated'
      respond_with(@project, :location => @project)
    else
      render :edit
    end
  end
  
  def destroy
    render :text => 'TODO'
  end
  
end
