class NotesController < ApplicationController

  include FaceboxRender

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
    respond_to do |format|
      format.html
      format.js { render_to_facebox }
    end
  end
  
  def update
    @note = @project.notes.find(params[:id])
    @note.update_attributes(params[:note])
    respond_with(@note, :layout => !request.xhr? )
  end
  
  def destroy
    @note = @project.notes.find(params[:id])
      Note.destroy(@note) if @note
      @id = params[:id]
      respond_with(@note, :layout => !request.xhr? )
  end

end
