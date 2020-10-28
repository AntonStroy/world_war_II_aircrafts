Rails.application.routes.draw do
  # get 'subtype/index'
  # get 'subtype/show'
  # get 'operators/index'
  # get 'operators/show'

  resources :subtypes, only: %i[index show]

  resources :operators, only: %i[index show]

  resources :pages, except: [:show]

  get "/pages/:permalink" => "pages#permalink", as: :permalink

  resources :aircrafts, only: %i[index show] do
    collection do
      get "search"
    end
  end
  resources :origin_countries, only: %i[index show]

  root to: "home#index"
end
