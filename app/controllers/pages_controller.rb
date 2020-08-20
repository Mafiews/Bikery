class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @my_rentals = current_user.rentals
    @my_bikes = current_user.bikes
    @ask_rentals = []
    @my_bikes.each do |bike|
      bike.rentals.each do |rental|
        @ask_rentals << rental
      end
    end
    @ask_rentals
  end
end
