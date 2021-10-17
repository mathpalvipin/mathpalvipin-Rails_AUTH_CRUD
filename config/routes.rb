Rails.application.routes.draw do
  
   
  # get 'advertisements', to:  'advertisements#index'
  namespace :api do
  resources :advertisement
  post 'sign_up', to: 'signup#create'
  post "sign_in", to: 'signin#create'
  # get 'sign_in', to: 'sessions#new'
  # post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'signin#destroy'
  end
  root 'home#index'
  get '/*path', to: 'home#index'

end
