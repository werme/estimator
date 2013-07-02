Estimator::Application.routes.draw do

  devise_for :users
  resources :users

  root to: 'pages#front'

  resources :estimates do
    resources :tasks, :except => [:index]
    resources :notes, :except => [:index, :show, :edit]
  end

  resources :project_types do
    resources :tasks, :except => [:index]
  end

  get 'settings' => 'pages#settings', as: :settings
  get 'home' =>     'pages#front',    as: :front

  get   'parent/:parent_id/new' =>            'tasks#new_child_task',  :as => 'new_child_task'
  get   'parent/:parent_id/tasks/:id/edit' => 'tasks#edit_child_task', :as => 'edit_child_task'
  post  'parent/:parent_id/tasks' =>          'tasks#create',          :as => 'child_tasks'
  get   'parent/:parent_id/tasks/:id' =>      'tasks#show',            :as => "child_task"
  put   'parent/:parent_id/tasks/:id' =>      'tasks#update'
  patch 'parent/:parent_id/tasks/:id' =>      'tasks#update'




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
  #     resource :sellerdevise
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
