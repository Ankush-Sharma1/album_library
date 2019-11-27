Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    resources :albums do
      resources :photos
    end
  end
    namespace :admin do
      root to: "admin/dashboards#index"
      # resource :dashboard, contoller: "dashboard", only: [] do
      #   get :index
      resources :dashboard do
        delete :destroy_album
      end
    end
  root 'albums#index'
end
