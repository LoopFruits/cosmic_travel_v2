Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/missions', to: 'missions#create'
  get 'planets', to: 'planets#index'
  resources :scientists # we're generating all of theese routes, thats why we aren't excluding anything
end
