class UsersController < ApplicationController


  def index
    binding.pry
  end

  def location
    binding.pry
    @latitude = params[:latitude]
    @longitude = params[:longitude]
    binding.pry
    create
  end

  def create
    binding.pry
    @user = User.create(latitude: @latitude,longitude: @longitude)
  end





    # binding.pry
    # @name = 'PLACE HOLDER'#@neighborhood.neighborhood_name
    # if @n.save
    #     format.html { redirect_to locations_path, notice: 'PLACEHOLDER'}
    # else
    #   alert('FAILED')
    # end
  # end



end
