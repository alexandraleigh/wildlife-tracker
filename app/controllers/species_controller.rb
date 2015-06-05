class SpeciesController < ApplicationController
  def index
    @species = Species.all

    render('species/index.html.erb')
  end

  def create
    @single_species = Species.new(:animal => params[:animal])
    if @single_species.save
      flash[:success] = "You have successfully added a new species to the database."
      redirect_to ("/species")
    else
      @species = Species.all
      flash[:danger] = "There was an error: Please enter a species"
      render ("index")
    end
  end

  def destroy
    @species = Species.find(params[:id])
    @species.destroy
    redirect_to ("/species")
  end
end
