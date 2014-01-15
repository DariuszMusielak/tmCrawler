TmCrawler::Application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show]

  authenticated :user do
    root to: "maps#index", as: "authenticated_root"
  end
  unauthenticated do
     root to: "home#index", as: "root"
  end

  resources :maps
end
