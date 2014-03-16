CardsGame::Application.routes.draw do
  get '/games/join' => 'games#join'
  post '/games/join' => 'games#addplayer'
  resources :games

  resources :players

  root 'static_pages#index'
  resources :cards

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  

  
end
