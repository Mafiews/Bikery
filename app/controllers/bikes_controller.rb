class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    # @bikes = Bike.all

      # if params[:starts_at].present?
      #   @start_date = Date.parse params[:starts_at]
      #   if params[:ends_at].present?
      #     @end_date = Date.parse params[:ends_at]
    if params[:bike_type].present?
      @type = params[:bike_type].downcase
      @bikes = Bike.where(bike_type: @type)
    else
      @bikes = Bike.all
    end
    #   end
    # end


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
