Rails.application.routes.draw do
  
  resources :people do
    resources :gifts
  end
  
  get '/export', to: 'people#export'
  
  root 'welcome#index'
end
