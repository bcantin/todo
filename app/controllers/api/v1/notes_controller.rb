class Api::V1::NotesController < ApplicationController

  before_filter :get_project

  respond_to :json

  def index
    respond_with(@notes = @project.notes)
  end
  
end