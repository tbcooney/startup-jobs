Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources	:jobs

  root 'welcome#index'
end
