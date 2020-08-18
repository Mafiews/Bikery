class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bike, only: [:show, :edit, :update, :destroy]
  def index
    @bikes = Bike.all
  end

  def show
    set_bike
    authorize @bike
  end

  def edit
    set_bike
    authorize @bike
  end

  def update
    set_bike
    @bike.update(bike_params)
    redirect_to bike_path(@bike)
    authorize @bike
  end

  def destroy
    set_bike
    @bike.destroy
    redirect_to bikes_path
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
