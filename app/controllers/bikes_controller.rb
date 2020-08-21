class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    @address = params[:address]
    # @bikes = Bike.where("")
    if params[:bike_type].present? && (params[:bike_type] != "All bikes") && (params[:address].present?)
      @type = params[:bike_type].downcase
      @bikes = Bike.near(@address, 5).select { |bike| bike.bike_type == @type }
    elsif params[:bike_type].present? && (params[:bike_type] != "All bikes")
      @type = params[:bike_type].downcase
      @bikes = Bike.geocoded.select { |bike| bike.bike_type == @type }
    elsif params[:address].present?
      @bikes = Bike.near(@address, 5)

    else
      @bikes = Bike.geocoded
    end
    @markers = @bikes.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        image_url: helpers.asset_url('markers.png'),
        infoWindow: render_to_string(partial: "info_window", locals: { bike: bike })
      }
    end
    # if params[:address] != ""
    #   location = Geocoder.search(params[:address])
    #   @lat = location[0].latitude
    #   @lng = location[0].longitude
    #   @marker = {
    #     lat: @lat,
    #     lng: @lng,
    #     image_url: helpers.asset_url('my-marker.png')

    #   }

    # @markers << @marker

  end



  def show
    set_bike
    authorize @bike
    @rental = Rental.new
    unless @bike.rentals.nil?
      @rentals = @bike.rentals
      @ratings = 0
      @ratings_sum = 0
      @rentals.each do |rental|
        unless rental.rating.nil?
          @ratings += 1
          @ratings_sum += rental.rating
          @renter = rental.user.first_name
        end
      end
      @ratings
      @ratings_sum
    end
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
