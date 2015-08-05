Rails.application.routes.draw do
  root 'sessions#new'

  resource  :session
  resources :stages

  resources :stages do
    resources :messages
  end
end
