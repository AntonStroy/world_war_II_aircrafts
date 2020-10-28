class SubtypesController < ApplicationController
  def index
    @subtypes = Subtype.all
  end

  def show
    @subtype = Subtype.find(params[:id])
  end
end
