Rails.application.routes.draw do

  # Home page
  root                'static_pages#home'
  
  # Static pages
  get 'resume'     => 'static_pages#resume'
  get 'contact'    => 'static_pages#contact'
  
  # Session
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  # Blog
  resources :articles
end
