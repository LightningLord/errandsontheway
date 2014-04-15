Errandsontheway::Application.routes.draw do


  # WARNING:  Do not use :routes, this conflicts
  # with Rails magic!!!!
  root :to => "trips#new"
  post 'trips/finalize', to: 'trips#finalize'
  resources :trips, only: [:new, :show, :create]
  resources :options, only: [:index]
  resources :errands, only: [:create]
  get '/:url', to: 'trips#summary', as: 'trip_summary'
  post '/coordinates-converter', to: 'coordinates#convert'

end
