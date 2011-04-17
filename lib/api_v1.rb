class ApiV1 < Grape::API
  
  prefix 'api'
  version 'v1'
  
  resource :projects do
    get do
      Project.all
    end
    
    get '/:id/tasks' do
      project = Project.find(params[:id])
      tasks = project.tasks
    end
    
    get '/:id/notes' do
      project = Project.find(params[:id])
      notes = project.notes
    end
    
    get '/:project_id/notes/:id' do
      project = Project.find(params[:project_id])
      notes = project.notes.find(params[:id])
    end
    
  end
  
end