Todo::Application.routes.draw do
  
  resources :projects do
    resources :tasks
    resources :notes
  end
  
  match 'projects/:project_id/tasks/:id/complete' => "tasks#complete", :as => :complete_task
  
  root :to => "projects#index"

end