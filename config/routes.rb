Rails.application.routes.draw do


  get 'feats/index'

  get 'feats/show'

  get 'feats/new'

  get 'feats/edit'

  get 'inscriptions/create'

  get 'inscriptions/destroy'

	root 'main#index'
	get '/meta', to: 'main#meta'

	resources :players, :characters, :spells, :spell_books do
		member do
			get :delete
		end
	end

	resources :spell_books do
		member do
			post :inscribe
			get :erase
			get :print
		end
	end

	resources :character_classes
	resources :races


end
