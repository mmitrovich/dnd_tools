class SpellBooksController < ApplicationController

	before_action :find_char_and_player

	layout :resolve_layout 

  	add_breadcrumb "home", :root_path
  	add_breadcrumb "Players", '\players'
  	

	def show
		@spellbook = SpellBook.find(params[:id])
		spell_list = @spellbook.spells.count > 0 ? Spell.sorted_name - @spellbook.spells : Spell.sorted_name
		@spell_options = spell_list.map{|spell| [spell.name, spell.id]}

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
			redirect_to spell_book_path(@spellbook, :character_id => @character.id)
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
		@spellbook = SpellBook.find(params[:id])
	end

	def destroy
		@spellbook = SpellBook.find(params[:id])
		@spellbook.destroy
		flash[:notice] = "Spellbook deleted!"
		redirect_to character_path(@character, :player_id => @player.id)
	end


	def inscribe
		@spellbook = SpellBook.find(params[:id])
		params[:inscribe_spells].each do |spell|
			@new_spell = Spell.find(spell)
			@spellbook.spells << @new_spell
		end
		redirect_to(spell_book_path(@spellbook, :character_id => @character.id))
	end

	def erase
		@spellbook = SpellBook.find(params[:id])
		@spell = Spell.find(params[:spell_id])
		@spellbook.spells.delete (@spell)
		redirect_to(spell_book_path(@spellbook, :character_id => @character.id))
	end

	def print
		@spellbook = SpellBook.find(params[:id])
		@spells = @spellbook.spells
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

	def resolve_layout
		case action_name
			when "print"
				"print_spells"
			else
				"main"
		end
	end



end
