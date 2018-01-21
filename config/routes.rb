Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  Rails.application.routes.draw do
    resources :recipes do
      resources :comments, except: [ :index, :new ]
      resources :steps
    end
  end

  # get "/recipes/:recipe_id/steps/:id/amend", to: "steps#amend", as: :amend_recipe_step

end
