Rails.application.routes.draw do
scope '(:locale)', locale: /es|en/ do
    get 'home/grettings'
    namespace :api do
      namespace :v1, defaults: { format: 'json' } do
        resources :users, only: %i[create] do
          # api/v1/users/login
          post 'login', on: :collection
        end
        resources :characters, only: %i[index create update destroy show] do
          # api/v1/characters/:character_id/restore
          post 'restore'
        end
        resources :movies, only: %i[index create update destroy show] do
          # api/v1/movies/:movie_id/restore
          post 'restore'
        end
      end
    end
  end
end
