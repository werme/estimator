Estimator::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
root 'estimates#index'

resources :estimates do
  resources :tasks, :except => [:index]
end

resources :project_types do
  resources :tasks, :except => [:index]
end

match 'settings' => 'settings#index', :as => 'settings', :via => :get
#match 'types/new' => 'project_types#new', :as => 'new_project_type', :via => :get
#match 'project_types/:project_type_id/tasks' => 'tasks#create', :as => 'project_type_tasks', :via => :post

#match 'project_types/:project_type_id/tasks/:id' => 'tasks#destroy', :as => 'project_type_task', :via => :delete
#match 'project_types/:project_type_id/tasks/:id' => 'tasks#update', :via => :put

# match 'project/:id/tasks/new' => 'tasks#new'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end