Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'

  devise_for :users, controllers: { registrations: 'registrations' }

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :posts
end
