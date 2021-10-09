Rails.application.routes.draw do
namespace :admin do
  devise_for :admins, controllers: {
    sessions:      'admin/admins/sessions',
    registrations: 'adimin/admins/registrations',
    pasword:       'admin/adimins/paswords'
  }
  resources :items, except: [:destroy]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :customers, except: [:create, :destroy, :new]
  resources :orders, only: [:index, :show, :update]
end
scope module: 'customer' do
  devise_for :customers, controllers: {
    sessions:      'customer/customers/sessions',
    registrations: 'customer/customers/registrations',
    paswprds:       'customer/customers/paswords'
  }
  resources :items, only: [:index, :show]
  resources :cart_items, only: [:create, :index, :update, :destroy]
  delete '/cart_items' => 'cart_items#all_destroy', as: 'all_destroy'
  post 'orders/check' => 'orders#check', as: 'check'
  get 'orders/thanks' => 'orders#thanks', as: 'thanks'
  resources :orders, only: [:new, :create, :index, :show]
  resources :customers, only: [:edit, :update]
  get 'customers/mypage' => 'customers#delete', as: 'mypage'
  get 'customers/delete' => 'customers#delete', as: 'delete'
  patch 'customers/deleted' => 'customers#deleted', as: 'delete'
  root to: 'homes#top'
  get 'about' => 'homes#about'

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
