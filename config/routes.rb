Rails.application.routes.draw do
  devise_for :users

  # いいね機能関係のルーティング
  # いいね機能 as: で prefix名　を指定できます
  post   '/like/:review_id' => 'likes#like',   as: 'like'
  delete '/like/:review_id' => 'likes#unlike', as: 'unlike'

  # path無しの時のトップページへリダイレクト
  root    'reviews#index'


  # メインのルーティング
  resources :arts, only:[:index, :show, :create, :new, :edit, :update] do
    resources :reviews, only:[:index, :show, :new, :create] do
      resources :chats, only:[:create]
    end
  end

    # 投稿後のリダイレクトが上手く行かなかったため、個別で定義している
    get '/arts/:art_id/reviews/:review_id' => 'reviews#show', as: 'redirect_chat'

# ログアウト？
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
