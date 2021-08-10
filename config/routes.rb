
Rails.application.routes.draw do
  # Home
  root to: 'site/welcome#index'

  # Devise routes
  devise_for :admins, skip: [:registrations]
  devise_for :users

  # Namespaced routes
  namespace :site do
    get   'welcome/index'
    get   'search', to: 'search#questions'
    get   'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    post  'answer', to: 'answer#question'
  end

  namespace :admins_backoffice do
    get 'welcome/index'
    resources :admins
    resources :subjects
    resources :questions
  end

  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
