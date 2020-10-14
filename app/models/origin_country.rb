class OriginCountry < ApplicationRecord
  has_many :aircrafts
  validates :name, presence: true, uniqueness: true
end
