Rails.application.routes.draw do
  resources :user_therapists
  resources :therapists
  
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  post '/users', to: 'users#create'
  post '/users/login', to: 'users#login'
  patch '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  post '/coping_skills', to: 'coping_skills#create'
  patch '/coping_skills/:id', to: 'coping_skills#update'
  delete '/coping_skills/:id', to: 'coping_skills#destroy'

  post '/diary_cards', to: 'diary_cards#create'
  patch '/diary_cards/:id', to: 'diary_cards#update'
  delete '/diary_cards/:id', to: 'diary_cards#destroy'

  post '/diary_card_trackers', to: 'diary_card_trackers#create'

  post '/emergency_contacts', to: 'emergency_contacts#create'
  patch '/emergency_contacts/:id', to: 'emergency_contacts#update'
  delete '/emergency_contacts/:id', to: 'emergency_contacts#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
