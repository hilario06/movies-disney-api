Rails.application.routes.draw do
scope '(:locale)', locale: /es|en/ do
    get 'home/grettings'
    namespace :api do
      namespace :v1, defaults: { format: 'json' } do
        resources :users, only: %i[create] do
          # api/v1/users/login
          post 'login', on: :collection
        end
        resources :characters, only: %i[index create update destroy]
      end
    end
  end
end
