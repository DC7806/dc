Rails.application.routes.draw do
  
  devise_for :admin_users, controllers: {registrations: "registrations"}
  mount Ckeditor::Engine => '/ckeditor'
  
  # user
  resources :articles, only: [:index, :show]
  resources :categories, only: :show
  root 'pages#home'

  # admin
  namespace :admin, path: Figaro.env.admin_path do
    root 'articles#index'
    resources :articles, :categories, :meta, :portfolios, except: :show
    get 'system', to: 'system#index'
    match 'update-system', to: 'system#update_system', via: :patch
  end
  
end