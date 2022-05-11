Rails.application.routes.draw do
  root 'stores#index'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  
  resources :stores
  resources :users,  except:[:create, :show, :destroy, :edit, :update] do
    resources :shipping_addresses
  end
  get '/users/:id', to: 'users#show', as: 'user'
  resources :orders
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
