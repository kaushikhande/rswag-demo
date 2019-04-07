Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :pets
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
