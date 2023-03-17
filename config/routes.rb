Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  root to: 'users#index'

  resources :jobs, only: %i[index show new create edit update] do
    resources :bids, only: %i[index new create update]
  end

  # Routes below are renamed to make users who are freelancers clearer
  get 'freelancers/', to: 'users#index', as: :freelancers
  get 'freelancers/:id', to: 'users#show', as: :freelancer
end
