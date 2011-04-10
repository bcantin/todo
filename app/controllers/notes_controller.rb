class NotesController < ApplicationController

  before_filter :get_project

  respond_to :html, :js

  def index
    @note = @project.notes.new
  end
  
  def create
    @note = @project.notes.new(params[:note])
    @note.save
    respond_with(@note, :layout => !request.xhr? )
  end

  def edit
    @note = @project.notes.find(params[:id])
  end
  
  def update
    @note = @project.notes.find(params[:id])
    if @note.update_attributes(params[:note])
      flash[:notice] = 'Note Updated'
    else
      flash[:error] = 'Note Note Updated'
    end
    redirect_to project_notes_path(@project)
  end
  
  def destroy
    @note = @project.notes.find(params[:id])
      Note.destroy(@note) if @note
      @id = params[:id]
      respond_with(@note, :layout => !request.xhr? )
  end

end
