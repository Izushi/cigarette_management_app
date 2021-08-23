Rails.application.routes.draw do
  root "tops#index"
  # root "graphs#index"
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                       passwords: "users/passwords",
                     }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tops
  get "/graphs", to: "graphs#index"
  # post "/graphs", to: "graphs#create"
  # patch "/graphs", to: "graphs#update"
  resource :graphs, only: [:index, :create, :update]
  resources :cigar_infos
  resources :profiles
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
