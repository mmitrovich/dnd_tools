class CharactersController < ApplicationController
  
  
	before_action :find_player

  	layout 'main'
  	add_breadcrumb "home", :root_path
  	add_breadcrumb "Players", '\players'

  

	def show
		@character = Character.find(params[:id])
		add_breadcrumb @player.name, player_path(@player)
		add_breadcrumb @character.name
	end

	def edit
		@character = Character.find(params[:id])
	end

	def update
		@character = Character.find(params[:id])
		if @character.update_attributes(character_params)
			flash[:notice] = "Character updated successfully..."
			redirect_to(character_path(@character, :player_id => @player.id))
		else
			render('edit')
		end
	end

	def new
		@character = Character.new
		@character.player_id = params[:player_id]
	end

	def create
		@character = Character.new(character_params)
		@character.player_id = @player.id
		if @character.save
			flash[:notice] = "Character created!"
			redirect_to player_path(@player)
		else
			render 'new'
		end
	end

	def delete
		@character = Character.find(params[:id])
	end

	def destroy
		@character = Character.find(params[:id])
		@character.destroy
		flash[:notice] = "Character deleted!"
		redirect_to player_path(@player)
	end


	private

	def find_player
		@player = Player.find(params[:player_id])
	end

	def character_params
		params.require(:character).permit(
			:name,
			:race,
			:character_class_id,
			:level
		)
	end
end
