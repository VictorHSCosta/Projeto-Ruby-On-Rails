Rails.application.routes.draw do
  devise_for :users

  resources :lists do
    resources :items do
      member do
        get :search
      end
    end
  end

  # Define a rota raiz
  root "lists#index"

  # Rota de saúde para verificações de status
  get "up" => "rails/health#show", as: :rails_health_check
end
