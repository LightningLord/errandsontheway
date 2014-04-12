Errandsontheway::Application.routes.draw do


  # WARNING:  Do not use :routes, this conflicts
  # with Rails magic!!!!
  root :to => "trips#new"

  resources :trips, only: [:new, :show, :create]
  resources :options, only: [:index]
  resources :errands, only: [:create]


end
