require "pry"
class NeighborhoodsController < ApplicationController

  def index
    longitude = params["/neighborhood"][:latitude]
    latitude = params["/neighborhood"][:longitude]
    respond_to do |format|
      format.js{}
    end
  end
end
