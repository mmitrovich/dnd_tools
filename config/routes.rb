Rails.application.routes.draw do

  get 'spell_books/show'

  get 'spell_books/new'

  get 'spell_books/edit'

  get 'spell_books/delete'

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
