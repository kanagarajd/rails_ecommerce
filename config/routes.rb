Rails.application.routes.draw do
  resources :products
  get 'say/hello'
  get 'say/goodbye'
  get 'welcome/index'
  root 'welcome#index'
  get 'welcome/show'
 end
