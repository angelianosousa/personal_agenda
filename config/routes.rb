Rails.application.routes.draw do
  
  get 'welcome_page/index'
  devise_for :users
  
  namespace :users_backoffice do
    resources :steps
    resources :objectives
    get 'calendars', to: "calendars#index"
    post 'steps/:id/check', to: "steps#check_step", as: "check_step"
    post 'steps/:id/uncheck', to: "steps#uncheck_step", as: "uncheck_step"
    get 'welcome', to: 'welcome_office#index'
  end

  # For Searchs
  get 'search_boards', to: "searchs#boards"

  root to: "welcome_page#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
