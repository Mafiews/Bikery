class BikesController < ApplicationController
<<<<<<< HEAD
  def index
    @bikes = Bikes.all
=======
  def show
    @bike = Bike.find(params[:id])
>>>>>>> f8bfa8368cc7791861778dfd864a48247c9d647c
  end
end
