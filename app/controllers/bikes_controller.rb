class BikesController < ApplicationController
  def index
    @bikes = Bikes.all
  end
end
