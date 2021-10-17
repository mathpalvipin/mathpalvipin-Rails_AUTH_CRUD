Rails.application.routes.draw do
  
  get 'allads'  ,to: 'home#ads'
   
  # get 'advertisements', to:  'advertisements#index'
  namespace :api do
  resources :advertisement
  get 'userAds' ,to: 'advertisement#userAds'
  delete 'deleteAds' ,to: 'advertisement#delete'
  put 'togglepublish' ,to: 'advertisement#togglepublish'
  post 'sign_up', to: 'signup#create'
  post "sign_in", to: 'signin#create'
  # get 'sign_in', to: 'sessions#new'
  # post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'signin#destroy'
  end
  root 'home#index'
  get '/*path', to: 'home#index'

end
