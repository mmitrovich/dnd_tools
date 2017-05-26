Rails.application.routes.draw do


  get 'spells/index'

  get 'spells/show'

  get 'spells/new'

  get 'spells/edit'

  get 'spells/delete'

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

	resources :character_classes
	resources :races


end
