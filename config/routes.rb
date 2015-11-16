Rails.application.routes.draw do

  get 'maps/index'

  get 'maps/show'

  get 'recommendations/new'

  get 'recommendations/show'

  get 'events/about', to: 'events#about'

  get 'events/profile', to: 'events#profile'

  resources :maps

  resources :events

  resources :recommendations

  get 'start', to: 'events#index'

  root 'events#index'

end
