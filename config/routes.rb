TmCrawler::Application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show]

  authenticated :user do
    root to: "maps#index", as: "authenticated_root"
  end
  unauthenticated do
     root to: "home#index", as: "root"
  end

  resources :maps, only: [:index, :show, :destroy, :create, :new]

  put '/maps/update_map', to: "maps#update_map", as: 'update_map'
  post '/maps/get_pending', to: "maps#get_pending", as: 'get_pending'
end
