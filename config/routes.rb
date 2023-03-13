Rails.application.routes.draw do
  root to: "pages#home"

  resources :jobs, only: %i[index show new create] do
    resources :bids, only: %i[index new create update]
  end

  get 'freelancers/', to: 'users#index', as: :freelancers
  get 'freelancers/:id', to: 'users#show', as: :freelancer
end
