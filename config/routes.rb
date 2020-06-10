Rails.application.routes.draw do
  root 'static_pages#workshop'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  controller :static_pages do
    get 'pages/privacy-policy' => :privacy
    get 'pages/terms' => :terms
    get 'pages/about' => :about
    get 'workshop' => :workshop
  end

  post '/workshop_users', to: 'users#create_workshop_users'

  get '/unsubscribe', to: 'users#unsubscribe', as: :unsubscribe
  post '/blogs/search', to: 'blogs#index', as: :blog_search
  resources :users, only: [:index, :destroy]
  resources :blogs, except: [:delete, :destroy]
  resources :tags, only: [:destroy]
end
