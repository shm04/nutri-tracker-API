Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get "up" => "rails/health#show", as: :rails_health_check

  namespace :api do
    resources :users do
      resources :patients
      resources :diets do
        get ':id', to: 'diets#show', on: :member
      end
    end
  end
end
