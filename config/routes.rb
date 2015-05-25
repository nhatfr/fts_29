Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  devise_scope :user do
    get "login" => "devise/sessions#new"
    get "logout" => "devise/sessions#destroy"
    get "sign_up" => "devise/registration#new"
  end
end
