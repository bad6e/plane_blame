class DashboardController < ApplicationController
  def show
    @flights = Departure.all
  end
end


