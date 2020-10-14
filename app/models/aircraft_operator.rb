class AircraftOperator < ApplicationRecord
  belongs_to :aircraft
  belongs_to :operator
end
