class DashboardController < ApplicationController

  def show
    @statistics = FlightsPresenter.new
  end
end


