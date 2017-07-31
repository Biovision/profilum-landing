Rails.application.routes.draw do

  resources :centers, :programs, except: [:index, :show]
  get 'programs' => 'programs#index', defaults: { format: :json }

  post 'profilum/login' => 'profilum#login', as: :profilum_login

  namespace :admin do
    resources :centers, only: [:index, :show]
    resources :programs, only: [:index, :show] do
      member do
        post 'toggle', defaults: { format: :json }
      end
    end
  end
end
