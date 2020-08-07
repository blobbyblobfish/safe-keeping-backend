Rails.application.routes.draw do
  resources :trackers
  # resources :diary_cards
  # resources :diary_card_trackers
  
  get '/users/:id', to: 'users#show'

  # get '/diary_cards', to: 'diary_cards#index'
  # get '/diary_cards/:id', to: 'diary_cards#show'
  post '/diary_cards', to: 'diary_cards#create'
  patch '/diary_cards/:id', to: 'diary_cards#update'
  delete '/diary_cards/:id', to: 'diary_cards#destroy'

  post '/diary_card_trackers', to: 'diary_card_trackers#create'
  patch '/diary_card_trackers/:id', to: 'diary_card_trackers#update'
  delete '/diary_card_trackers/:id', to: 'diary_card_trackers#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
