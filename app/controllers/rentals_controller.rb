class RentalsController < ApplicationController

  def create
    start_date = Date.parse rental_params[:start_date]
    end_date = Date.parse rental_params[:end_date]
    sum_days = (end_date - start_date).to_i
    @rental = Rental.new(start_date:start_date, end_date:end_date)
    @rental.bike_id = params[:bike_id]
    @rental.user = current_user
    @rental.rental_price = sum_days * @rental.bike.price
    authorize @rental
    @rental.save
    if @rental.save
      redirect_to rental_path(@rental)
    else
      redirect_to bike_path(@rental.bike)
    end
  end

  def show
    set_rental
    authorize @rental
  end

  def index
    @rentals = Rental.where(user_id: current_user.id)
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end
end
