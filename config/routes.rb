Rails.application.routes.draw do
  #resources :users
  devise_for :users, controllers: {
                                    omniauth_callbacks: 'omniauth_callbacks',
                                    registrations: 'registrations' }
  resources :posts
  root 'posts#index'
end
