Rails.application.routes.draw do
  root to: 'providers#new'
  resources :providers, only: [:new, :create, :show] do
    member do
      get 'confirm'
    end
  end
end
