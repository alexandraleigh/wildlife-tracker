Rails.application.routes.draw do
  root 'species#index'
  match('species', via: :get, to: 'species#index')
  match('species', via: :post, to: 'species#create')
  match('sightings', via: :get, to: 'sightings#show')
  match('sightings/:species_id', via: :get, to: 'sightings#show')
  match('sightings', via: :post, to: 'sightings#create')
  match('sightings/:id/edit', via: :get, to: 'sightings#edit')
  match('sightings/:id/edit', via: [:patch, :put], to: 'sightings#update')
  match('sightings/:id/edit', via: :delete, to: 'sightings#destroy')
  match('/species/:id', via: :delete, to: 'species#destroy')

end
