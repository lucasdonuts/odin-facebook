Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks',
                                    registrations: 'registrations' }
  resources :users
  get 'users/:id/friends', to: 'users#friends', as: :friends
  resources :likes, only: [:create, :destroy]
  resources :comments
  resources :posts do
    member do
      post 'like'
      delete 'unlike'
    end
    resources :comments do
      member do
        post 'like'
        delete 'unlike'
      end
    end
  end
  resources :friend_requests, only: [:create, :destroy]

  root 'posts#index'
end
