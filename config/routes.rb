require 'api_v1'

Todo::Application.routes.draw do
  
  match '/api/v1/*other' => ApiV1
  
  resources :projects do
    resources :tasks do
      post :sort, on: :collection
    end
    resources :notes
  end
  
  match 'projects/:project_id/tasks/:id/complete' => "tasks#complete", :as => :complete_task
  
  root :to => "projects#index"

end
