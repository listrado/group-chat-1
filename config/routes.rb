Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'refresh_messages', to: 'groups#refresh', as: 'refresh_messages'

  resources :users, only: %i[show] do
    resources :connections, only: %i[new create]
    resources :groups, only: %i[index show] do
      resources :connections, only: %i[update show]
      resources :messages, only: %i[new create]
    end
  end
end
