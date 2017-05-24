Rails.application.routes.draw do


	root 'main#index'
	get '/meta', to: 'main#meta'

	resources :players do
		member do
			get :delete
		end
	end

	resources :character_classes

	resources :characters

end
