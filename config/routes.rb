Herokuapp::Application.routes.draw do
  root  'static_pages#home'
  #get "static_pages/home"
  match '/home', to: 'static_pages#home', via: 'get'
  #get "static_pages/about"
  match '/about', to: 'static_pages#about', via: 'get'
  #get "static_pages/contact"
  match '/contact', to: 'static_pages#contact', via: 'get'
  
end
