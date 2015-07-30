Rails.application.routes.draw do
  devise_for :admins, :skip => [:registrations]
  resources :registrations

  root 'static_pages#home'

  get '/about' => 'static_pages#about'
  get '/calendar' => 'static_pages#calendar'
  get '/events/:id' => 'static_pages#event', constraints: {id: /concessions|mooncake_festival|dumpling_night|hotpot_night|lunar_banquet|cfest|basketball_tournament/}
  get '/sponsors' => 'static_pages#sponsors'

  get '/contact' => 'contact#new'
  post '/contact' => 'contact#create'

  get '/register' => 'registers#new'
  post '/register' => 'registers#create'

  get '/ao/index' => 'auxiliaries#index'
  get '/ao/signup' => 'auxiliaries#new'
  post '/ao/signup' => 'auxiliaries#create'

  get '/admin' => 'admin#index'
  post '/admin' => 'admin#login'
  get '/admin/events/all' => 'admin#view_events'
  get '/admin/events/:id' => 'admin#view_event'
  get '/admin/events/:id/edit' => 'admin#edit_event'
  post '/admin/events/:id/edit' => 'admin#save_edited_event'
  get '/admin/events/add' => 'admin#add_event'
  post '/admin/events/add' => 'admin#create_event'

  match '/404' => 'errors#file_not_found', via: :all
end
