Rails.application.routes.draw do
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

  resources :users, only: [:index, :new, :create, :destroy]
  resources :blogs, except: [:delete]
  resources :tags, only: [:create, :destroy]
end
