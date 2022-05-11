Rails.application.routes.draw do
  root 'stores#index'
  
  resources :stores
  resources :users,  except:[:create, :show, :destroy, :edit, :update] do
    resources :shipping_addresses
  end
  resources :orders
  resources :products

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
