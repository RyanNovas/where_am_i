require "pry"
class NeighborhoodsController < ApplicationController

  def index
    binding.pry
    longitude = params["/neighborhoods"][:latitude]
    latitude = params["/neighborhoods"][:longitude]
    respond_to do |format|
      format.js{}
    end
  end
end
