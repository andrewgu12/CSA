Rails.application.routes.draw do
  # get '/registrations', :to => redirect('/404.html')
  resources :registrations
  # get 'static_pages/home'

  # get 'static_pages/about'

  # resources :students
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # home page
  root 'static_pages#home'
  # get '/home' => 'static_pages#home'
  get '/about' => 'static_pages#about'
  get '/calendar' => 'static_pages#calendar'

  get '/contact' => 'contact#new'
  post '/contact' => 'contact#create'
  
  get '/register' => 'registrations#new'
  post '/registrations' => 'registrations#create'

  get '/events/*path' => 'event#event'
end
