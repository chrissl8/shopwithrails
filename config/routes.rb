Rails.application.routes.draw do
  
  resources :people do
    resources :gifts
  end
  
  root 'welcome#index'
end
