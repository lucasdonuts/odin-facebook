Rails.application.routes.draw do
  resources :likes, only: [:create, :destroy]
  resources :comments
  #resources :users
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks',
                                    registrations: 'registrations' }
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

  root 'posts#index'
end
