# frozen_string_literal: true

Rails.application.routes.draw do
  scope path: '/api' do
    api_version(module: 'Api::V1', path: { value: 'v1' }, defaults: { format: 'json' }) do
      resources :bets, only: %i[show update destroy]
      resources :casinos, only: %i[index create]
      resources :withdrawals, only: %i[show update destroy]
      resources :deposits, only: %i[show update destroy]
      resources :users, only: %i[show update destroy]
      resources :bets, only: %i[index create]
      resources :withdrawals, only: %i[index create]
      resources :deposits, only: %i[index create]
      resources :users, only: %i[show update destroy]
      resources :bets, only: %i[index create]
      resources :withdrawals, only: %i[index create]
      resources :deposits, only: %i[index create]
      resources :users
      resources :bets, only: %i[index create]
      resources :withdrawals, only: %i[index create]
      resources :deposits, only: %i[index create]
    end
  end
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :deposits

  resources :casinos do
    resources :users, only: %i[index create]
    resources :bets, only: %i[index create]
    resources :withdrawals, only: %i[index create]
    resources :deposits, only: %i[index create]
    resources :users, only: %i[index create]
    resources :bets, only: %i[index create]
    resources :withdrawals, only: %i[index create]
    resources :deposits, only: %i[index create]
    resources :users
    resources :bets, only: %i[index create]
    resources :withdrawals, only: %i[index create]
    resources :deposits, only: %i[index create]
  end

  resources :users do
    resources :bets, only: %i[index create]
    resources :withdrawals, only: %i[index create]
    resources :deposits, only: %i[index create]
    resources :deposits
  end

  resources :users do
    resources :bets, only: %i[index create]
    resources :withdrawals, only: %i[index create]
    resources :deposits, only: %i[index create]
    resources :withdrawals
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'casinos#index'
end
