Rails.application.routes.draw do


	root 'main#index'
	get '/meta', to: 'main#meta'

	resources :players do
		member do
			get :delete
		end
	end

	resources :characters do
		member do
			get :delete
		end
	end

	resources :spells, :spell_books do
		member do
			get :delete
		end
	end


	resources :character_classes
	resources :races


end
