Rails.application.routes.draw do




  get 'inscriptions/create'
  get 'inscriptions/destroy'

	root 'main#index'
	get '/meta', to: 'main#meta'

	resources :players, :characters, :spells, :spell_books, :feats do
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

	resources :characters do
		member do
			post :train_feat
			get :untrain_feat
			get :print_feats
		end
	end

	resources :character_classes
	resources :races

end
