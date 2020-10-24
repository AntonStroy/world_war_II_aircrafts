class OriginCountry < ApplicationRecord
  has_many :aircrafts
  validates :name, presence: true, uniqueness: true

  def self.orderd_by_aircrafts
    self.select("origin_countries.*")
        .select("COUNT(origin_countries.id) as aircraft_count")
        .left_joins(:aircrafts)
        .group("origin_countries.id")
        .order("aircraft_count DESC")
  end
end
