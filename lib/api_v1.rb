class ApiV1 < Sinatra::Base
  
  ##
  #  PROJECTS
  ##
  get '/api/v1/projects' do
    Project.all.to_json
  end
  
  ##
  #  TASKS
  ##
  get '/api/v1/projects/:id/tasks' do
    Project.find(params[:id]).tasks.to_json
  end
  
  ##
  #  NOTES
  ##
  get '/api/v1/projects/:id/notes' do
    Project.find(params[:id]).notes.to_json
  end
  
end