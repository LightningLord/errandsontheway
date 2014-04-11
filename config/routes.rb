Errandsontheway::Application.routes.draw do


  # WARNING:  Do not use :routes, this conflicts
  # with Rails magic!!!!
  resources :trips, only: [:new, :show, :create]
  root :to => "trips#new"
  # You can have the root of your site routed with "root"
  # root 'welcome#index'


end
