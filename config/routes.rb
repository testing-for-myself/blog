Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do 
    resources :comments
  end

  resources :comments do
    resources :child_comments
  end
  
  root 'welcome#index'
end
