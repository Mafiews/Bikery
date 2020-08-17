class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def show
    @bike = Bike.find(params[:id])
  end
end
