Rails.application.routes.draw do

	root 'players#index'


  get 'access/login'
	post 'access/attempt_login'
	get 'access/logout'

  get 'inscriptions/create'
  get 'inscriptions/destroy'


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
			get :edit_feat_uses
			post :update_feat_uses
		end
	end

	resources :character_classes
	resources :races

end
