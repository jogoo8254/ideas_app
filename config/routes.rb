Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ideas do
    resources :created_ideas, only: [:create, :destroy] 
  end
end
