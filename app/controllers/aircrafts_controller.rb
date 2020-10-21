class AircraftsController < ApplicationController
  def index
    @aircrafts = Aircraft.includes(:origin_country).order("name")
  end

  def show
    @aircraft = Aircraft.find(params[:id])
  end
end
