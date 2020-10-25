class Aircraft < ApplicationRecord
  belongs_to :origin_country
  has_many :aircraft_subtypes
  has_many :subtypes, through: :aircraft_subtypes

  validates :name, :aircraft_type, presence: true
  validates :service_start, :units_build, numericality: { only_integer: true }
  validates :unit_price, numericality: { greater_than_or_equal_to: 0 }
end
