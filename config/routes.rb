Rails.application.routes.draw do
  resources :pages, except: [:show]

  get "/pages/:permalink" => "pages#permalink", as: :permalink

  resources :aircrafts, only: %i[index show]
  resources :origin_countries, only: %i[index show]

  root to: "home#index"
end
