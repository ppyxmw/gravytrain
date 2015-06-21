Rails.application.routes.draw do
  root to: 'providers#new'
  default_url_options :host => "local:3000"
  resources :providers, only: [:new, :create, :show] do
    member do
      get 'confirm'
    end
  end
end
