Rails.application.routes.draw do
 if :user present?
  root to: 'static_pages#landing'
 else
  root to: 'static_pages#mainmenu'
end

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

  get  "/trips/:id"           => "trips#show"
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

  #Job
  resources :jobs
  get    "/jobs/:id/confirm"  => "jobs#confirm"
  get    "/my_jobs"           => "jobs#my_jobs"
  post 'twilio/voice' => 'twilio#voice'

end
