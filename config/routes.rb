Rails.application.routes.draw do
  root                'static_pages#home'
  get 'resume'     => 'static_pages#resume'
  get 'contact'    => 'static_pages#contact'
  resources :articles
end
