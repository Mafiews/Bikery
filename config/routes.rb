Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :bikes do
    resources :rentals, only: [:create]
  end
  resources :rentals, only: [:destroy, :show, :index, :edit, :update]
  get 'dashboard', to: 'pages#dashboard'
  post 'rentals/:id', to: 'rentals#update_confirmation', as: "rental_update_confirmation"
end
