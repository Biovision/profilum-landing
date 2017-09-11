Rails.application.routes.draw do

  resources :age_groups, :schools, except: [:index, :show]
  resources :centers, except: [:show]
  resources :programs, except: [:index]
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
        put 'age_groups/:age_group_id' => :add_age_group, as: :age_group, defaults: { format: :json }
        delete 'age_groups/:age_group_id' => :remove_age_group, defaults: { format: :json }
        put 'schools/:school_id' => :add_school, as: :school, defaults: { format: :json }
        delete 'schools/:school_id' => :remove_school, defaults: { format: :json }
      end
    end
    resources :program_clicks, only: [:index, :show]
    resources :schools, only: [:index, :show] do
      member do
        post 'toggle', defaults: { format: :json }
      end
    end
  end
end
