Rails.application.routes.draw do
  root 'races#index'

  get 'search/index'
  get '/search', to: 'search#index'

  resources :races do
    get 'faction/:faction', to: 'races#faction', on: :collection, as: 'by_faction'
  end

  resources :player_classes, path: 'player_class'
  resources :specializations, path: 'specialization'
  resources :heroes, path: 'hero'

  get "about", to: "races#about"
end
