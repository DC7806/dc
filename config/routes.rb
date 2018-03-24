Rails.application.routes.draw do
  
  devise_for :admin_users, controllers: {registrations: "registrations"}
  mount Ckeditor::Engine => '/ckeditor'
  
  # user
  resources :articles, only: [:index, :show]
  
  # admin
  namespace :admin, path: Settings.admin_path do
    root 'articles#index'
    resources :articles, :categories, except: :show
  end
  
end