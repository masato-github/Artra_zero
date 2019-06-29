Rails.application.routes.draw do
  devise_for :users

  root    'reviews#index'
  resources :reviews

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # いいね機能 as: で prefix名　を指定できます
  post   '/like/:review_id' => 'likes#like',   as: 'like'
  delete '/like/:review_id' => 'likes#unlike', as: 'unlike'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
