class SpeciesController < ApplicationController
  def index
    @species = Species.all
    render('species/index.html.erb')
  end

  def create
    @species = Species.create(:animal => params[:animal])
    render('species/success.html.erb')
  end
end
