BwUpload::Application.routes.draw do

  get '/missing' => 'bw_files#missing', :as => 'missing'
  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'my-account' => 'users#my_account', :as => 'my_account'
  get 'downloads/:permalink' => 'bw_files#download', :as => 'download'
  resources :users
  resources :sessions
  resources :bw_files, path: 'bw-files'

  get '/files' => 'bw_files#index'
  get '/admin' => 'home#admin', :as => 'admin'
  match '/admin-create' => 'bw_files#admin_create', :as => 'admin_create', via: [:get, :post]
 
  root to: 'home#index'
end
