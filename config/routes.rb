# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq" if Rails.env.development?
  resources :signatures
  resources :tickets
  resources :pools
  resources :contracts
  resources :transactions
  resources :wallets
  resources :blocks, only: %i[index show]
  resources :chains
  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }

  devise_scope :user do
    get "sign_in", to: "users/sessions#new"
    get "sign_out", to: "users/sessions#destroy"
    get "sign_up", to: "users/registrations#new"
  end

  root to: "application#home"
  get "mining_profile", to: "application#mining_profile"
  get "terms", to: "application#terms"
  get "privacy_policy", to: "application#privacy_policy"

  # load the api routes from api_routes.rb
  draw :api
end
