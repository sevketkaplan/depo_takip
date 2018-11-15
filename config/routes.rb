Rails.application.routes.draw do
	resources :osearches	
	resources :bakiyes
	resources :odemes
	resources :iades
	resources :isearches    
	resources :personelgideris
	resources :firmagideris
	resources :aracgideris
	resources :aracs
	resources :harcanansuts
	resources :uruns 
	resources :urunlers
	resources :pakettipis
	resources :pakettipis
	resources :urunadis
	resources :urunlers
	resources :satilans
	
	devise_for :users, :controllers => { :registrations => 'registrations' } 
	resources :users, except: :create
	post 'create_user' => 'users#create', as: :create_user  
	post '/users/:id/edit', to: 'users#update'
	patch '/users/:id/edit', to: 'users#update'

	resources :suts
	resources :searches
	resources :agsearches
	root "satilans#index"	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
