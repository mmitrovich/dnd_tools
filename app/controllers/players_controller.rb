class PlayersController < ApplicationController

	layout 'main'

	def index
		@players = Player.sorted
	end

	def show
		@player = Player.find(params[:id])
	end

	def edit
	end

	def update
	end
end
