class OriginCountry < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
