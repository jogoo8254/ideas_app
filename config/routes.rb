Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :ideas do
    resources :created_ideas, only: [:create, :destroy] 
  end
  get('/', { to: 'welcome#index', as: 'root' })

end
