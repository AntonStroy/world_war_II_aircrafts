class HomeController < ApplicationController
  def index
    @aircrafts = Aircraft.includes(:origin_country)
                         .order("units_build DESC")
                         .limit(10)

    @origin_countries = OriginCountry.orderd_by_aircrafts
                                     . limit(10)
  end
end
