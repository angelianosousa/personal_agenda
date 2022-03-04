Rails.application.routes.draw do
  
  devise_for :users
  
  namespace :users_backoffice do
    get 'welcome/index'
    get 'calendar_events/index'
    
    resources :tasks, except: [:index, :new]
    resources :boards
    resources :users_manage, only: [:edit, :update, :destroy]
  end

  # For Searchs
  get 'search_boards', to: "searchs#boards"

  root to: "users_backoffice/welcome#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
