class RaceController < ApplicationController

	skip_before_action :verify_authenticity_token, :only => :destroy


	def index
		@races = Race.sorted
	end

	def show
		@race = Race.find(params[:id])
	end

	def new
		@race = Race.new
	end

	def create
		@race = Race.new(race_params)
		@race.name.capitalize!
		if @race.save
			flash[:notice] = "Race added..."
			redirect_to races_path
		else
			render 'new'
		end
	end

	def edit
		@race = Race.find(params[:id])
	end

	def update
		@race = Race.find(params[:id])
		if @race.update_attributes(race_params)
			flash[:notice] = "Race updated..."
			redirect_to(races_path)
		else
			render('edit')
		end
	end

	def destroy
		@race = Race.find(params[:id])
		@race.destroy
		redirect_to races_path
	end


	private

	def race_params
		params.require(:character_class).permit(
			:name
		)
	end
end
