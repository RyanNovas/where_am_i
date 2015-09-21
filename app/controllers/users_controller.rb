class UsersController < ApplicationController


  def index
  end

  def location
    @latitude = params[:latitude]
    @longitude = params[:longitude]
    create
  end

  def create
    @user = User.create(latitude: @latitude,longitude: @longitude)
    @user.find_neighborhood_name
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
