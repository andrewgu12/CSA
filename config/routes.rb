Rails.application.routes.draw do  
  resources :registrations
  root 'static_pages#home'  
  get '/about' => 'static_pages#about'
  get '/calendar' => 'static_pages#calendar'
  get '/events/*path' => 'static_pages#event'
  get '/sponsors' => 'static_pages#sponsors'

  get '/contact' => 'contact#new'
  post '/contact' => 'contact#create'
  
  get '/register' => 'registrations#new'
  post '/registrations' => 'registrations#create'    
end
