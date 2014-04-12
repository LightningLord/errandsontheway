Errandsontheway::Application.routes.draw do


  # WARNING:  Do not use :routes, this conflicts
  # with Rails magic!!!!
  root :to => "trips#new"
  get '/:url', to: 'trips#summary', as: 'trip_summary'
  post 'trips/finalize', to: 'trips#finalize'
  resources :trips, only: [:new, :show, :create]
  resources :options, only: [:index]


end
