Rails.application.routes.draw do
  devise_for :users, controllers: {
                       registrations: "users/registrations",
                       passwords: "users/passwords",
                     }
  # root "cigar_infos#index"
  root "graphs#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :graphs, only: [:index, :create, :update]
  resources :cigar_infos
  resources :profiles
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
