CardsGame::Application.routes.draw do
  
  resources :players

  root 'static_pages#index'
  resources :cards

  
end
