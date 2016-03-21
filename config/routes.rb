Rails.application.routes.draw do
  devise_for :users
 get '/' => 'recipes#index'
 get '/recipes' => 'recipes#index'
 get 'recipes/new' => 'recipes#new' 
 post '/recipes/create' => 'recipes#create'
 get '/recipes/:id' => 'recipes#show' 
end