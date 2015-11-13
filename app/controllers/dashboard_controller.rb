class DashboardController < ApplicationController
  autocomplete :airport, :name, :full => true

  def show
    @statistics = FlightsPresenter.new


  end
end


