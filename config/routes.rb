Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'

  resources :projects, only: [ :index, :show ] do
    collection do
      get "top", to: "projects#top", as: :top
    end
    resources :investments, only: [ :new, :create ] do
      resources :payments, only: [:new, :create]
    end
    # resources :outputs, only: [ :new, :create ]
  end

  # sidekiq not sure it works
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  resources :users, only: [ :show ] do
    resources :investments, only: [ :index, :show ]
  end

  get "learn_more", to: "pages#learn_more", as: :learn_more

  resources :leads, only: [ :new, :create ]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # for API, not necessary at this point
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :outputs, only: [ :index, :show, :update, :create ]
    end
  end
end
