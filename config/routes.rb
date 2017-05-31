Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :listings do
  	resources :orders
  end

  get "/mercarry" => "sessions#new"
	get "/sign_" => "clearance/sessions#new", as: "sign_in"
	get "/auth/:provider/callback" => "sessions#create_from_omniauth"

end
