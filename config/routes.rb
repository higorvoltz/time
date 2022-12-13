# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :profile_backoffice do
    get 'welcome/index'
  end
  namespace :admin_backoffice do
    get 'welcome/index'
  end
  devise_for :profiles
  devise_for :admins
  get 'welcome/index'

  root to: 'welcome#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
