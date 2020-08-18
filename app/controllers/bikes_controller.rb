class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index


    # params[:starts_at] params[:ends_at]
    @bikes = Bike.all
    @start_date = Date.parse params[:starts_at]
    @end_date = Date.parse params[:ends_at]
    @type = params[:bike_type]
    if @type.present?
      @bikes = Bike.where(bike_type: @type, starts_at: @start_date, ends_date: @ends_date)
    end
  end

  def show
    set_bike
    authorize @bike
    @rental = Rental.new
  end

  def edit
    set_bike
    authorize @bike
  end

  def update
    set_bike
    authorize @bike
    @bike.update(bike_params)
    redirect_to bike_path(@bike)
  end

  def destroy
    set_bike
    authorize @bike
    @bike.destroy
    redirect_to bikes_path
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    authorize @bike
    @bike.save
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end

  private

  def bike_params
    params.require(:bike).permit(:model, :bike_type, :condition, :price, :description, :photo, :availability)
  end

  def set_bike
    @bike = Bike.find(params[:id])
  end
end
