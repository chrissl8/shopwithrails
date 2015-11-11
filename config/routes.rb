Rails.application.routes.draw do
  
  resources :people do
    resources :gifts
  end
  
  get '/export', to: 'people#export'
  
#get '/purchased_true', to: 'gifts#set_purchased_true'
  get '/purchased_false', to: 'gifts#set_purchased_false'
  
  resources :people do
    resources :gifts do
      member do
        get '/purchased_true', to: 'gifts#set_purchased_true'
        get '/purchased_false', to: 'gifts#set_purchased_false'
      end
    end
  end
  
  resources :gifts
  
  root 'welcome#index'
end
