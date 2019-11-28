Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }
  
  root 'items#index'
  get 'items/side_bar' => 'items#side_bar', as:'side_bar'
  get 'items/search' => 'items#search', as:'search'
  get 'users/:id/check' => 'users#check', as:'check'
  get 'thanks' => 'orders#thanks'
  
  namespace :admins do
    get 'items/search' => 'items#search'
    get 'users/:id/check' => 'users#check'
    resources :labels, only: [:index, :create, :update, :destroy]
    resources :artists, only: [:index, :create, :update, :destroy]
    resources :categories, only: [:index, :create, :update, :destroy]
    resources :orders, only: [:show, :index, :update]
    resources :items
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end

  resources :items, only: [:index, :show, :create]
  resources :orders, only: [:create, :new, :destroy, :show]
  # CartItemモデルにURLからitem_idを持たせるため、createのアドレスを変更しています
  post 'items/:id/cart_items' => 'cart_items#create', as: 'cart_item_create'
  resources :cart_items, only: [:new, :index, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :destroy]

end
