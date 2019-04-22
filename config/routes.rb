Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get('/ideas/new', to: 'ideas#new', as: :new_idea)
  post('/ideas', to: 'ideas#create', as: :ideas)
  get('/ideas/:id', to: 'ideas#show', as: :idea)
  get('/ideas/:id/edit', to: 'ideas#edit', as: :edit_idea)
  patch("/ideas/:id", to: "ideas#update")
  delete('/ideas/:id', to: 'ideas#destroy')
  get('/ideas', to: 'ideas#index')
  get('/', to: 'ideas#index', as: :root)
end
