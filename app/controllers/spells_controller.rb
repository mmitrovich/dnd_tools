class SpellsController < ApplicationController

  layout 'main'

  add_breadcrumb "home", :root_path

  def index
    @spells = Spell.sorted_name
    add_breadcrumb "Spells"
  end

  def show
    @spell = Spell.find(params[:id])
    add_breadcrumb "Spells", spells_path
    add_breadcrumb @spell.name
  end

  def new
    @spell = Spell.new
  end

  def create
    @spell = Spell.new(spell_params)
    if @spell.save
      flash[:notice] = "Spell added!"
      redirect_to spell_path(@spell)
    else
      render 'new'
    end
  end

  def edit
    @spell = Spell.find(params[:id])
  end

  def update
    @spell = Spell.find(params[:id])
    if @spell.update_attributes(spell_params)
      flash[:notice] = "Spell updated..."
      redirect_to(spell_path(@spell))
    else
      render('edit')
    end
  end

  def delete
    @spell = Spell.find(params[:id])
  end

  def destroy
    @spell = Spell.find(params[:id])
    @spell.destroy
    flash[:notice] = "Spell deleted!"
    redirect_to spells_path
  end



  private

  def spell_params
    params.require(:spell).permit(
      :name,
      :level,
      :school,
      :casting_time,
      :ritual,
      :range,
      :components,
      :duration,
      :description
    )
  end
end
