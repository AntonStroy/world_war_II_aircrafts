class OperatorsController < ApplicationController
  def index
    @operators = Operator.all
  end

  def show
    @operator = Operator.find(params[:id])
  end
end
