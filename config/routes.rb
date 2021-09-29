Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reserves, only: [:index, :show, :create]
    end

    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
