TmCrawler::Application.routes.draw do
  resources :maps

  resources :users

  root to: "home#index", as: "root"

end
