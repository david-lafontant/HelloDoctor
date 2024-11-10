Rails.application.routes.draw do
  resources :patients
  devise_for :users
  root 'publics#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'doctor', to: 'publics#doctor', as: :doctor
  get 'receptionist', to: 'publics#receptionist', as: :receptionist
  # Defines the root path route ("/")
  # root "articles#index"
end
