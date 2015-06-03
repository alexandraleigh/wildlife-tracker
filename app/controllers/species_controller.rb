class SpeciesController < ApplicationController
  def index
    @species = Species.all
    render('species/index.html.erb')
  end

  def create
    @species = Species.create(:animal => params[:animal])
    redirect_to ("/species")
  end

  def destroy
    @species = Species.find(params[:id])
    @species.destroy
    redirect_to ("/species")
  end
end
