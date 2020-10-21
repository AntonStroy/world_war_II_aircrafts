class OriginCountriesController < ApplicationController
  def index
    @origin_countries = OriginCountry.all
  end

  def show
    @origin_countries = OriginCountry.find(params[:id])
  end
end
