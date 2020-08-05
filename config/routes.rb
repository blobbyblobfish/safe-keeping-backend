Rails.application.routes.draw do
  resources :diary_card_trackers
  resources :trackers
  resources :diary_cards
  
  get '/users/:id', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
