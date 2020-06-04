Rails.application.routes.draw do
  scope path: '/api' do
    api_version(module: 'Api::V1', path: { value: 'v1' }, defaults: { format: 'json' }) do
      resources :monkeys, only: [:show, :update, :destroy]
      resources :casinos do
        resources :monkeys, only: [:index, :create]
      end
    end
  end
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  mount Sidekiq::Web => '/queue'

  resources :casinos do
    resources :monkeys, only: %i[index create]
  end

  root to: 'pages#home'
end
