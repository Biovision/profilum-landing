Rails.application.routes.draw do

  resources :age_groups, :centers, :programs, :schools, except: [:index, :show]
  get 'programs' => 'programs#index', defaults: { format: :json }

  post 'profilum/login' => 'profilum#login', as: :profilum_login

  namespace :admin do
    resources :age_groups, only: [:index, :show] do
      member do
        post 'priority', defaults: { format: :json }
      end
    end
    resources :centers, only: [:index, :show]
    resources :programs, only: [:index, :show] do
      member do
        post 'toggle', defaults: { format: :json }
      end
    end
    resources :schools, only: [:index, :show] do
      member do
        post 'toggle', defaults: { format: :json }
      end
    end
  end
end
