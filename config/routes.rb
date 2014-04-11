Errandsontheway::Application.routes.draw do

  root to: 'trips#new'
  resources :trips, only: [:new, :create]

end
