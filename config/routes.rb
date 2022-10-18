Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/factories', to: 'factories#index'
  get '/factories/new', to: 'factories#new'
  get '/factories/:id', to: 'factories#show'
  get '/stores', to: 'stores#index'
  get '/stores/:id', to: 'stores#show'
  get '/factories/:factory_id/stores', to: 'factory_stores#index'
  post '/factories', to: 'factories#create'
  get '/factories/:id/edit', to: 'factories#edit'
  patch '/factories/:id', to: 'factories#update'
  get '/factories/:id/stores/new', to: 'factory_stores#new'
  post '/factories/:id/stores/new', to: 'factory_stores#create'
  get '/stores/:id/edit', to: 'stores#edit'
  patch '/stores/:id', to: 'stores#update'
end
