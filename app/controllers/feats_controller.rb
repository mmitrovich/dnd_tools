class FeatsController < ApplicationController

	layout "main"
	add_breadcrumb "home", :root_path

	def index
		@feats = Feat.sorted
	end

	def show
		@feat = Feat.find(params[:id])
	end

	def new
		@feat = Feat.new
	end

	def create
		@feat = Feat.new(feat_params)
	    if @feat.save
	      flash[:notice] = "Feat added!"
	      redirect_to feat_path(@feat)
	    else
	      render 'new'
	    end
	end

	def edit
	end

	def delete
	end


	private

	def feat_params
		params.require(:feat).permit(
			:name,
			:use_type,
			:uses,
			:reset,
			:description
		)
	end
end
