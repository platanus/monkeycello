Rails.application.routes.draw do
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  scope path: '/api' do
    api_version(module: "Api::V1", path: { value: "v1" }, defaults: { format: 'json' }) do
      resources :bets, only: [:show, :update, :destroy]
      resources :monkeys, only: [:show, :update, :destroy] do
        resources :bets, only: [:index]
      end
      resources :casinos do
        resources :bets, only: [:index, :create]
        resources :monkeys, only: [:index, :create]
      end
    end
  end
  resources :casinos, only: %i[show]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  mount Sidekiq::Web => '/queue'

  root to: 'pages#home'
end
