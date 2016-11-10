Rails.application.routes.draw do
  root 'makes#index'

  resources :makes, only: [] do
    resources :models, only: :index
  end
end
