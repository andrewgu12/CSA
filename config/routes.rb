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

  resources :auxiliaries, :path => "/ao" do
    post 'accept', on: :member
  end

  get '/admin/ao/dashboard' => "admin#ao_dashboard"
  get '/admin' => 'admin#index'
  post '/admin' => 'admin#login'
  # get '/admin/events/:id/edit' => 'admin#edit_event'
  # post '/admin/events/:id/edit' => 'admin#save_edited_event'
  get '/admin/events/add' => 'admin#event_new'
  post '/admin/events/add' => 'admin#event_create'
  get '/admin/pictures/add' => 'admin#pictures_new'
  post '/admin/pictures/add' => 'admin#pictures_create'
  get '/admin/events/all' => 'admin#events_view'
  get '/admin/events/:id' => 'admin#event_view'
  get '/admin/events/:id/edit' => 'admin#event_edit'
  post '/admin/events/:id/edit' => 'admin#event_update'
  post '/admin/events/:id/delete' => 'admin#event_delete'

  match '/404' => 'errors#file_not_found', via: :all
end
