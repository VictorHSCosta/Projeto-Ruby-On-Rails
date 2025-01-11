Rails.application.routes.draw do
  get "home/landing"
  devise_for :users

  resources :lists do
    resources :items do
      member do
        get :search
      end
    end
  end

  # Define a rota raiz
  # root "lists#index"


  root to: "home#landing"



  # Rota de saúde para verificações de status
  get "up" => "rails/health#show", as: :rails_health_check
end
