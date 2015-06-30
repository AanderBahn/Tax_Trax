Rails.application.routes.draw do
  # root to: 'static_pages#mainmenu'
  root to: 'static_pages#landing'

  resources :year_ending_odometers

  resources :filings

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # Routes for Static Pages
  get "/landing", :controller  => 'static_pages', :action => 'landing', :as => 'landing'
  get "/mainmenu", :controller => 'static_pages', :action => 'mainmenu', :as => 'main_menu'
  get "/mileagefilingdisplay"  => 'static_pages#mileagefilingdisplay'
  get "/disclaimer_filing"     => 'static_pages#disclaimer_filing'

  #PROFILES
  resource :profiles

  # TRIPS
  resources :trips
  #get  "/jobs/index"         => "jobs#index"
  #get  "/trips/new"          => "trips#new"
  #post "/trips"              => "trips#create"
  get  "/trips/:id"           => "trips#show"
  #get  "/trips/:id/edit"     => "trips#edit"
  post "/trips/:id"           => "trips#update"
  get  "/trips/:id/confirm"   => "trips#confirm"
  get  "/my_trips"            => "trips#my_trips"
  get  "/filing1"             => "trips#filing1"
  get  "/filing2"             => "trips#filing2"
  get  "/filing3"             => "trips#filing3"
  get "/mileagefilingdisplay" => 'trips#mileagefilingdisplay'


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

  post 'twilio/voice' => 'twilio#voice'

  # PROTOTYPE
  get "/go",      :controller => 'static_pages', :action => 'go'
  get "/stop",    :controller => 'static_pages', :action => 'stop'
  get "/log",     :controller => 'static_pages', :action => 'log'
  get "/confirm", :controller => 'static_pages', :action => 'confirm'
  get 'static_pages/home'
  get 'static_pages/help'
end
