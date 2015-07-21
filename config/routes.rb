Rails.application.routes.draw do
  resources :registrations

  root 'static_pages#home'

  get '/about' => 'static_pages#about'
  get '/calendar' => 'static_pages#calendar'
  get '/events/:id' => 'static_pages#event', constraints: {id: /concessions|mooncake_festival|dumpling_night|hotpot_night|lunar_banquet|cfest|basketball_tournament/}
  get '/sponsors' => 'static_pages#sponsors'

  get '/contact' => 'contact#new'
  post '/contact' => 'contact#create'

  get '/register' => 'registrations#new'
  post '/registrations' => 'registrations#create'
  get '/ao/index' => 'auxiliaries#index'
  get '/ao/signup' => 'auxiliaries#new'
  post '/ao/signup' => 'auxiliaries#create'

  get '/admin' => 'admin#index'
  post '/admin' => 'admin#login'

  match '/404' => 'errors#file_not_found', via: :all
end
