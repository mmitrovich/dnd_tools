class PlayersController < ApplicationController

	layout 'main'

	add_breadcrumb "home", :root_path

	def index
		@players = Player.sorted
	end

	def show
		@player = Player.find(params[:id])
		add_breadcrumb "players", players_path
	end

	def edit
		@player = Player.find(params[:id])
	end

	def update
		@player = Player.find(params[:id])
		if @player.update_attributes(player_params)
			flash[:notice] = "Player updated successfully..."
			redirect_to(player_path(@player))
		else
			render('edit')
		end
	end


	private

	def player_params
		params.require(:player).permit(
			:name,
			:email,
			:phone
		)
	end
end
