Rails.application.routes.draw do 
  get 'applies/new'
  
  devise_for :users, :controllers => {:registrations => "users/registrations", :confirmations => "users/confirmations", :sessions => "users/sessions", :passwords => "users/passwords"}, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  devise_scope :user do

    # route for register
    get '/register/1', to: 'users/registrations#new'
    get '/register/2', to: 'users/registrations#notice'
    post '/register/2', to: 'users/registrations#create'
    get '/register/3', to: 'users/confirmations#show'
    patch '/register/3', to: 'users/registrations#update'
    
    # route for user profile
    get '/my', to: 'users/sessions#user_profile'

    # route for informations edit
    get '/my/info', to: 'users/registrations#edit'
    put '/my/info', to: 'users/registrations#update'

    #route for forgot password 
    get '/forgot_password', to: 'users/passwords#new'
    get '/forgot_password', to: 'users/passwords#edit'

    # routes for apply job
    get  '/apply',   to: 'applies#new' #r
    get  '/confirm', to: 'applies#show' #r
    post '/confirm', to: 'applies#create' #r
    get  'done',     to: 'applies#done' #r

    # route for applied jobs
    get '/my/jobs', to: 'applies#see_applied_jobs'


    
    get '/admin/login', to: 'admin/sessions#new'
  end

  root "jobs#index"

  resources :cities
  resources :industries



  resources :jobs do
      # bo id di
    collection do
      get :search, to: "jobs#search"
      get :confirm, to: 'jobs#confirm'
    end
  end


  get '/applied_jobs', to: 'applied_jobs#index'
  get '/applied_jobs/down_load', to: 'applied_jobs#download_csv'
  
  
  get '/favourite', to: 'favourites#show'
  post '/favourite/add', to: 'favourites#create'
  delete '/favourite/destroy', to: 'favourites#destroy'
  post '/favourite/apply', to: 'favourites#apply'


  get '/history', to: 'histories#index'
  post '/history', to: 'histories#apply'
end

