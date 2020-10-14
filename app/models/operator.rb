class Operator < ApplicationRecord
  has_many :aircraft_operators
  has_many :aircrafts, through: :aircraft_operators

  validates :name, presence: true, uniqueness: true
end
