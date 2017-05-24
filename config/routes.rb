Rails.application.routes.draw do


  get 'characters/show'

  get 'characters/edit'

  get 'characters/new'

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
