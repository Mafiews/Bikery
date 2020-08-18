class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
    authorize @bike
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create

  end
end
