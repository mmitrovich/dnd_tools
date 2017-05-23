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

	def new
		@player = Player.new
	end

	def create
		@player = Player.new(player_params)
		if @player.save
			flash[:notice] = "Player created!"
			redirect_to player_path(@player)
		else
			render 'new'
		end
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

	def delete
		@player = Player.find(params[:id])
	end

	def destroy
		@player = Player.find(params[:id])
		@player.destroy
		flash[:notice] = "Player deleted!"
		redirect_to players_path
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
