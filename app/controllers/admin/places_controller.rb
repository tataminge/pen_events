class Admin::PlacesController < ApplicationController
  before_action :authenticate_admin!

  def create
    @place = Place.new(place_params)
    if @place.save
      redirect_to admin_genres_path, notice: "You have edited place successfully."
    else
      render "create", alert: "Failed to post."
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    if  @place.update(place_params)
      redirect_to admin_genres_path, notice: "You have edited place successfully."
    else
      render "edit", alert: "Failed to edit."
    end
  end

  private

  def place_params
    params.require(:place).permit(:place)
  end

end
