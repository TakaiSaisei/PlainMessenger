# frozen_string_literal: true

Rails.application.routes.draw do
  get 'set_language/english'
  get 'set_language/russian'
  resources :messages
  resources :rooms
  devise_for :users

  root 'rooms#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
