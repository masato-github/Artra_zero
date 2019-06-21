Rails.application.routes.draw do
  root    'reviews#index'
  resources :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
