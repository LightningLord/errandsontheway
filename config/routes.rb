Errandsontheway::Application.routes.draw do

  root to: 'routes#new'
  resources :routes, only: [:new, :create]

end
