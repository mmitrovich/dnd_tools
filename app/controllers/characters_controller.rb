class CharactersController < ApplicationController
  	skip_before_action :verify_authenticity_token

	before_action :find_player

  	layout :resolve_layout
  	add_breadcrumb "home", :root_path
  	add_breadcrumb "Players", '\players'

  

	def show
		@character = Character.find(params[:id])
		feat_list = @character.feats.count > 0 ? Feat.sorted - @character.feats : Feat.sorted
		@feat_options = feat_list.map{|spell| [spell.name, spell.id]}
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


	def train_feat
		@character = Character.find(params[:id])
		params[:train_feats].each do |feat|
			@character.feats << Feat.find(feat)
		end
		redirect_to(character_path(@character, :player_id => @player.id))
	end

	def untrain_feat
		@character = Character.find(params[:id])
		@character.feats.delete (Feat.find(params[:feat_id]))
		redirect_to(character_path(@character, :player_id => @player.id))
	end

	def print_feats
		@character = Character.find(params[:id])
		@feats = @character.feats.sorted_name
	end

	def edit_feat_uses
		@character = Character.find(params[:id])
		@training = @character.trainings.where(:feat_id => params[:feat_id]).first
		@feat = Feat.find(params[:feat_id])

	end

	def update_feat_uses
		@character = Character.find(params[:id])
		@training = @character.trainings.where(:feat_id => params[:feat_id]).first
		@feat = Feat.find(params[:feat_id])
		@training.custom_uses_count = params[:character][:trainings][:custom_uses_count]
		if @training.save
			flash[:notice] = "Uses count updated..."
			redirect_to(character_path(@character, :player_id => @player.id))
		else
			render('edit_feat_uses')
		end
	end


	private

	def find_player
		@player = Player.find(params[:player_id])
	end

	def character_params
		params.require(:character).permit(
			:name,
			:race,
			:character_class,
			:level
		)
	end

	def resolve_layout
		case action_name
			when "print_feats"
				"print_feats"
			else
				"main"
		end
	end

	
end
