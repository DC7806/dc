Rails.application.routes.draw do
  # user
  resources :articles, only: [:index, :show]
  # admin
  namespace :admin, path: Settings.admin_path do
    resources :articles, except: :show
  end
  
end
