class OriginCountriesController < ApplicationController
  def index
    @origin_countries = OriginCountry.all
  end

  def show
    @origin_country = OriginCountry.find(params[:id])
  end
end
