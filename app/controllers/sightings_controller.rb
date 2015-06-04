class SightingsController < ApplicationController
  def show
    @species = Species.find(params[:species_id])
    @sightings = @species.sightings
    render('sightings/show.html.erb')
  end

  def create
    @species = Species.find(params[:species_id])
    @sightings = @species.sightings
    @sighting = Sighting.new(
      :species_id => params[:species_id],
      :date => params[:date],
      :latitude => params[:latitude],
      :longitude => params[:longitude])
    if @sighting.save
      flash[:notice] = "Sighting created."
      redirect_to ("/sightings/#{@sighting.species_id}")
    else
      flash[:notice] = "Error: Please enter some data"
      render ('sightings/show.html.erb')
    end
  end

  def edit
    @sighting = Sighting.find(params[:id])
    @species = @sighting.species
    render('sightings/edit.html.erb')
  end

  def update
    @sighting = Sighting.find(params[:id])
    @sighting.update(
      :date => params[:date],
      :latitude => params[:latitude],
      :longitude => params[:longitude])
    flash[:notice] = "Sighting updated."
    redirect_to ("/sightings/#{@sighting.species_id}")
  end

  def destroy
    @sighting = Sighting.find(params[:id])
    @sighting.destroy
    flash[:notice] = "Sighting deleted."
    redirect_to ("/sightings/#{@sighting.species_id}")
  end
end
