class OriginCountriesController < ApplicationController
  def index
    @origin_countries = OriginCountry.orderd_by_aircrafts
  end

  def show
    @origin_country = OriginCountry.find(params[:id])
  end
end
