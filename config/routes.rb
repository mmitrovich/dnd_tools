Rails.application.routes.draw do


  get 'race/index'

  get 'race/show'

  get 'race/new'

  get 'race/edit'

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

	resources :characters

end
