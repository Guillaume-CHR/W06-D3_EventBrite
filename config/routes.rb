Rails.application.routes.draw do

  root 'events#index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do 
  	get "/my_profile" => "registrations#show" 
  end
  resources :attendances
  resources :events
	resources :charges
	
end
