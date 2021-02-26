Rails.application.routes.draw do
  devise_for :users

  resources :users, only: %i[index edit show update]
  resources :courses
  root 'home#index'

  get 'privacy_policy', to: 'home#privacy_policy'
end
