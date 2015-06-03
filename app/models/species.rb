class Species < ActiveRecord::Base
  validates :animal, :presence => true

  has_many :sightings
end
