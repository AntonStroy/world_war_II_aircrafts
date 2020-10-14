class Subtype < ApplicationRecord
  has_many :aircraft_subtypes
  has_many :aircrafts, through: :aircraft_subtypes

  validates :name, presence: true, uniqueness: true
end
