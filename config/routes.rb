Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  scope :api do
    use_doorkeeper do
      skip_controllers :authorizations, :applications,
                       :authorized_applications
    end
  end

  namespace :api do
    namespace :admin do
      resources :activities
    end
    namespace :users do
      post :create, path: '/register' ,to: 'create'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end