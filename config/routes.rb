Rails.application.routes.draw do
  #resources :users
  devise_for :users#, :controllers => { registrations: 'registrations' }
  resources :posts
  root 'posts#index'
end
