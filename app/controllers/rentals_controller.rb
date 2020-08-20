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

  def review
    raise
  end

  def show
    set_rental
    authorize @rental
  end

  def index
    @rentals = Rental.where(user_id: current_user.id)
  end

  def edit
    set_rental
    authorize @rental
  end

  def update
    set_rental
    start_date = Date.parse rental_params[:start_date]
    end_date = Date.parse rental_params[:end_date]
    sum_days = (end_date - start_date).to_i
    sum_price = sum_days * @rental.bike.price
    authorize @rental
    @rental.update( start_date: start_date, end_date: end_date, rental_price:sum_price)
    redirect_to rentals_path
  end

  def update_confirmation
    set_rental
    authorize @rental
    @rental.update(confirmation: params[:validated])
  end

  def destroy
    set_rental
    authorize @rental
    @rental.destroy
    redirect_to rentals_path
  end

  private
  def confirmation_params
    params.require().permit(:confirmation)
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end
end
