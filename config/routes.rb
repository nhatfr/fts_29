Rails.application.routes.draw do
  devise_for :users
  # , controllers: {sessions: "devise/sessions"}
  root 'static_pages#index'

   devise_scope :user do
    delete "/logout"    => "devise/sessions#destroy"
    # post "/login"    => "devise/sessions#create"
    get "/login"     => "devise/sessions#new" 
   end
end
