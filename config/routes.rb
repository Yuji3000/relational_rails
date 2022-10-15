Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/factories', to: 'factories#index'
  get '/factories/:id', to: 'factories#show'
  get '/stores', to: 'stores#index'
  get '/stores/:id', to: 'stores#show'
  get '/factories/:factory_id/stores', to: 'factory_stores#index'
end
