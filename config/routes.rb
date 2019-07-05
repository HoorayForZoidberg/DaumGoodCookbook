Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :recipes do
    resources :comments, except: [ :index, :new ]
    resources :photos, except: [ :index, :new, :show ]
    resources :steps do
      collection do
        patch :sort
      end
    end
    get '/new_recipe_ingredient', to: "recipes#new_recipe_ingredient"
    post '/new_recipe_ingredient', to: "recipes#create_recipe_ingredient"
    post '/add_new_ingredient', to: "recipes#add_new_ingredient"
    post '/add_new_measure', to: "recipes#add_new_measure"
    delete '/destroy_recipe_ingredient', to: "recipes#destroy_recipe_ingredient"
  end

  resources :ingredients
  resources :measures

  get '/profile/:id', to: "pages#profile", as: 'profile'

end

