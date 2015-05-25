Rails.application.routes.draw do
  devise_for :users
  # devise_for :users, controllers: {sessions: "devise/sessions"}
  root 'static_pages#index'

   devise_scope :user do
    get "/logout"    => "devise/sessions#destroy"
   end
end
