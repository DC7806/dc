Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # user
  resources :articles, only: [:index, :show]
  # admin
  namespace :admin, path: Settings.admin_path do
    resources :articles, :categories, except: :show
  end
  
end