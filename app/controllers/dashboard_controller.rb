class DashboardController < ApplicationController
  def show
    @flightstats ||= FlightsPresenter.new.save
  end
end


