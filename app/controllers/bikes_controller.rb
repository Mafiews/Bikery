class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @bikes = Bike.all
    # @api_key = AIzaSyAnyVo9HyzR3Mr_13s4n6FBlDXqymvYeY4
  end

  def show
    @bike = Bike.find(params[:id])
  end
end
