Rails.application.routes.draw do
  resources :trackers
  # resources :diary_cards
  # resources :diary_card_trackers
  
  get '/users/:id', to: 'users#show'
  post '/diary_cards', to: 'diary_cards#create'
  post '/diary_card_trackers/', to: 'diary_card_trackers#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
