class AircraftSubtype < ApplicationRecord
  belongs_to :aircraft
  belongs_to :subtype
end
