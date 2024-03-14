Rails.application.routes.draw do
  root'races#index'

  get"/races", to: "races#index"
  get"about", to: "races#about"
end
