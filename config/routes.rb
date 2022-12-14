Rails.application.routes.draw do
  devise_for :users
  root "homes#top"
  resources :users, only: [:index, :show, :edit, :update]
  resources :books do
    resources :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
