Todo::Application.routes.draw do
  
  namespace :api do
    namespace :v1 do
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
      resources :projects do
        resources :tasks
        resources :notes
      end
    end
    
    namespace :v2 do
      resources :projects
    end
  end
  
  resources :projects do
    resources :tasks do
      post :sort, on: :collection
    end
    resources :notes
  end
  
  match 'projects/:project_id/tasks/:id/complete' => "tasks#complete", :as => :complete_task
  
  root :to => "projects#index"

end
