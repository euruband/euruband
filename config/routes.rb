Rails.application.routes.draw do
  root 'sessions#new'

  resource  :session
  resources :stages

  resources :stages do
    resources :messages
    put :reset, on: :member
  end
end
