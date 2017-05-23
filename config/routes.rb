Rails.application.routes.draw do
  get 'character_classes/index'

  get 'character_classes/show'

  get 'character_classes/new'

  get 'character_classes/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


	root 'main#index'
	get '/meta', to: 'main#meta'

	resources :players do
		member do
			get :delete
		end
	end

	resources :character_classes

end
