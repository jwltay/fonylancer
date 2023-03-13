Rails.application.routes.draw do
  root to: "pages#home"

  resources :jobs, only: %i[index show new create]
  resources :users, only: %i[index show]
end
