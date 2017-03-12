Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources	:jobs

  authenticated :user do
  	root 'jobs#index'
  end

  root 'welcome#index'
end
