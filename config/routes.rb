Rails.application.routes.draw do
  devise_for :users
  root to: 'static_pages#mainmenu'

  # Routes for Static Pages
  get "/mainmenu", :controller => 'static_pages', :action => 'mainmenu', :as => 'main_menu'

  # Routes for the User resource:
  # USERS
  # get '/users/new' => 'users#new'
  # post '/create_user' => 'users#create'
  #get('/users', { :controller => 'users', :action => 'index' })
  # get('/users/:id', { :controller => 'users', :action => 'show' })
  # get('/users/:id/edit', { :controller => 'users', :action => 'edit' })
  # get('/update_user/:id', { :controller => 'users', :action => 'update' })
  # get('/delete_user/:id', { :controller => 'users', :action => 'destroy' })

  # TRIPS

  resources :trips
  #get  "/jobs/index"        => "jobs#index"
  #get  "/trips/new"          => "trips#new"
  #post "/trips"              => "trips#create"
  get  "/trips/:id"          => "trips#show"
  #get  "/trips/:id/edit"     => "trips#edit"
  post "/trips/:id"          => "trips#update"
  get  "/trips/:id/confirm"  => "trips#confirm"
  get  "/my_trips"           => "trips#my_trips"

  #Vehicle
  resources :vehicles
  get   "/vehicles/:id/confirm"  => "vehicles#confirm"
  get   "/my_vehicles"           => "vehicles#my_vehicles"

  # get   "/vehicles/new"          => "vehicles#new"
  # post  "/vehicles"              => "vehicles#create"
  # get   "/vehicles/index"        => "vehicles#index"
  # get   "/vehicles/:id"          => "vehicles#show"

  # get   '/vehicles/:id/edit', :controller => 'vehicles', :action => 'edit',   :as => 'edit_vehicles'
  # patch '/vehicles/:id',    :controller => 'vehicles', :action => 'update'

  # post  "/vehicles/:id"          => "vehicles#update"
  # delete "/vehicles/:id"         => "vehicles#destroy"

  #Job
  resources :jobs
  #get    "/jobs/new"          => "jobs#new"
  #post   "/jobs"              => "jobs#create"
  #get    "/jobs/index"        => "jobs#index"
  #get    "/jobs/:id"          => "jobs#show"
  #get    "/jobs/:id/edit"     => "jobs#edit"
  #post   "/jobs/:id"          => "jobs#update"
  get    "/jobs/:id/confirm"  => "jobs#confirm"
  get    "/my_jobs"           => "jobs#my_jobs"
  #delete "/jobs/:id"          => "jobs#destroy"

  # PROTOTYPE
  get "/go",      :controller => 'static_pages', :action => 'go'
  get "/stop",    :controller => 'static_pages', :action => 'stop'
  get "/log",     :controller => 'static_pages', :action => 'log'
  get "/confirm", :controller => 'static_pages', :action => 'confirm'
  get 'static_pages/home'
  get 'static_pages/help'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
