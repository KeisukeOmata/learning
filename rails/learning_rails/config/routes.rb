Rails.application.routes.draw do
  resources :users
  get 'rooms/show'
  root 'hoges#index'
  get 'hoges/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Sidekiqのキューの状態を確認するWebUI
  if Rails.env.development?
    require "sidekiq/web"
    mount Sidekiq::Web => "/sidekiq"
  end
end
