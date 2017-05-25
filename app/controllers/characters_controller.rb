class CharactersController < ApplicationController
  
  
	before_action :find_player

  	layout 'main'

  

	def show

	end

	def edit
	end

	def new
		@character = Character.new
		@character.player_id = params[:player_id]
	end

	def create
	end


	private

	def find_player
		@player = Player.find(params[:player_id])
	end
end
