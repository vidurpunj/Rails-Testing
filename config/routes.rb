Rails.application.routes.draw do
  get 'welcome/index'
  resources :books
  resources :authors

  root to: "welcome#index"
end
