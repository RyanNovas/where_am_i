class NeighborhoodsController < ApplicationController
  def index
    hood = Neighborhood.new
    @name = hood.neighborhood_name
  end
end
