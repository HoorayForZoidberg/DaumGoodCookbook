Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :recipes do
    resources :comments, except: [ :index, :new ]
    resources :steps do
      collection do
        patch :sort
      end
    end
    get '/new_recipe_ingredient', to: "recipes#new_recipe_ingredient"
    post '/new_recipe_ingredient', to: "recipes#create_recipe_ingredient"
    post '/add_new_ingredient', to: "recipes#add_new_ingredient"
  end

  resources :ingredients
  resources :measures

  get '/profile', to: "pages#profile"
end
