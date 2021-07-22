
Rails.application.routes.draw do
  # Home
  root to: 'site/welcome#index'

  # Devise routes
  devise_for :admins
  devise_for :users

  # Namespaced routes
  namespace :site do
    get 'welcome/index'
  end

  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins, only: %i[index]
  end

  namespace :users_backoffice do
    get 'welcome/index'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
