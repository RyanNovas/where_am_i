require "pry"
class NeighborhoodsController < ApplicationController

  def index
    hood = Neighborhood.new
    @name = hood.neighborhood_name
  end

  def location
    binding.pry
    @longitude = params[:latitude]
    @latitude = params[:longitude]
    respond_to do |format|
      format.js{}
    end
  end
end
