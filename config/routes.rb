Rails.application.routes.draw do
  root'races#index'

  get"races", to: "races#index"
  get"races/:id", to: "races#show"
  get"about", to: "races#about"
  get 'races/faction/:faction', to: 'races#faction', as: 'races_by_faction'
end
