Rails.application.routes.draw do
  devise_for :users
  root "graphs#index"
  root "cigar_infos#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :graphs, only: [:index, :create, :update]
  resources :cigar_infos
end
