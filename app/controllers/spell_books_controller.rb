class SpellBooksController < ApplicationController

	before_action :find_char_and_player

	layout 'main'
  	add_breadcrumb "home", :root_path
  	add_breadcrumb "Players", '\players'

  	

	def show
		@spellbook = SpellBook.find(params[:id])
		add_breadcrumb @player.name, player_path(@player)
		add_breadcrumb @character.name, character_path(@character, :player_id => @player.id)
		add_breadcrumb @spellbook.name
	end

	def new
		@spellbook = SpellBook.new
		@spellbook.character_id = @character.id
	end

	def create
		@spellbook = SpellBook.new(spellbook_params)
		@spellbook.character_id = @character.id
		if @spellbook.save
			flash[:notice] = "Spellbook created!"
			redirect_to character_path(@character, :player_id => @player.id)
		else
			render 'new'
		end
	end

	def edit
		@spellbook = SpellBook.find(params[:id])
	end

	def update
		@spellbook = SpellBook.find(params[:id])
		if @spellbook.update_attributes(spellbook_params)
			flash[:notice] = "Spellbook updated successfully..."
			redirect_to(spell_book_path(@spellbook, :character_id => @character.id))
		else
			render('edit')
		end
	end

	def delete
	end



	private

	def find_char_and_player
		@character = Character.find(params[:character_id])
		@player = Player.find(@character.player_id)
	end

	def spellbook_params
		params.require(:spell_book).permit(
			:name,
			:description,
			:character_id
		)
	end
end
