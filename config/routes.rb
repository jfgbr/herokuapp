Herokuapp::Application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :categories
  resources :services
  resources :appointments, only: [:create, :destroy]
  
  root  'static_pages#home'
  match '/home', to: 'static_pages#home',         via: 'get'
  match '/about', to: 'static_pages#about',       via: 'get'
  match '/contact', to: 'static_pages#contact',   via: 'get'
  
  match '/signup',  to: 'users#new',              via: 'get'
  match '/signin',  to: 'sessions#new',           via: 'get'
  match '/signout', to: 'sessions#destroy',       via: 'delete'
  
  match '/service', to: 'services#new',           via: 'get'
  #match '/services_edit', to: 'services#edit',    via: 'get'
  #get "services/edit"
  #get "services/index"
  
  match '/appointments',  to: 'appointments#new',  via: 'get'
  #match '/appointment/delete',  to: 'appointments#destroy',         via: 'delete'
  
  #get "user/employees" => "users#employees", :as => "employees", :format => :json
  get "categories/:employee_id/employee_categories" => "categories#employee", :as => "employee_categories", :format => :json
  get "categories/:category_id/category_services" => "categories#services", :as => "category_services", :format => :json
  
end
