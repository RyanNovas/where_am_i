class UsersController < ApplicationController


  def index
    @user = User.new
  end


  def create
    @user = User.create(latitude: params["user"]["latitude"],longitude: params["user"]["longitude"])
    @user.find_neighborhood_name
    render :show
  end









end
