class CharacterClassesController < ApplicationController
	skip_before_action :verify_authenticity_token, :only => :destroy

	layout 'main'

	def index
		@classes = CharacterClass.sorted
	end

	def show
		@character_class = CharacterClass.find(params[:id])
	end

	def new
		@character_class = CharacterClass.new
	end

	def create
		@character_class = CharacterClass.new(class_params)
		if @character_class.save
			flash[:notice] = "Class added..."
			redirect_to(character_classes_path)
		else
			render 'new'
		end
	end

	def edit
		@character_class = CharacterClass.find(params[:id])
	end

	def update
		@character_class = CharacterClass.find(params[:id])
		if @character_class.update_attributes(class_params)
			flash[:notice] = "Class updated..."
			redirect_to(character_classes_path)
		else
			render('edit')
		end
	end

	def destroy
		@character_class = CharacterClass.find(params[:id])
		@character_class.destroy
		redirect_to character_classes_path
	end


	private

	def class_params
		params.require(:character_class).permit(
			:name
		)
	end
end
