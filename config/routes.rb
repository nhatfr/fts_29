Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "login" => "devise/sessions#new"
    get "logout" => "devise/sessions#destroy"
    get "sign_up" => "devise/registration#new"
  end

  root "static_pages#index"
  resources :categories, only: :index

  namespace :admin do
    root to: "categories#index"
    resources :categories, except: :show
    resources :questions
  end
end
