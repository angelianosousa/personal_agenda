Rails.application.routes.draw do
  get 'website/index'

  devise_for :users
  namespace :users_backoffice do
    get 'welcome/index'
  end

  root to: "website#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
