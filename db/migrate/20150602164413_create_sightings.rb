class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.references :species
      t.column :date, :date
      t.column :latitude, :string
      t.column :longitude, :string
      t.timestamp
    end
  end
end
