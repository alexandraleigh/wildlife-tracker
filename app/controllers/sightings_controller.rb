class SightingsController < ApplicationController
  def show
    @species = Species.find(params[:species_id])
    @sightings = @species.sightings
    render('sightings/show.html.erb')
  end

  def create
    @species = Species.find(params[:species_id])
    @sighting = Sighting.create(
      :species_id => params[:species_id],
      :date => params[:date],
      :latitude => params[:latitude],
      :longitude => params[:longitude])
    render('sightings/success.html.erb')
  end

  def edit
    @sighting = Sighting.find(params[:id])
    @species = @sighting.species
    render('sightings/edit.html.erb')
  end

  def update
    @sighting = Sighting.find(params[:id])
    if @sighting.update(
        :date => params[:date],
        :latitude => params[:latitude],
        :longitude => params[:longitude])
      render ('sightings/success.html.erb')
    else
      render ('sightings/edit.html.erb')
    end
  end

  def destroy
    @sighting = Sighting.find(params[:id])
    @species = @sighting.species
    @sighting.destroy
    render('sightings/destroy.html.erb')
  end
end
