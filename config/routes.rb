Rails.application.routes.draw do
  get 'store/index'
  resources :products
  get 'say/hello'
  get 'say/goodbye'
  get 'welcome/index'
  root 'store#index'
  get 'welcome/show'
 end
