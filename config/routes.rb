CardsGame::Application.routes.draw do
  
  resources :games

  resources :players

  root 'static_pages#index'
  resources :cards

  
end
