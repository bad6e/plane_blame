class DenverSouthwestWorker
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.flightstats.com/flex/flightstatus/rest/")
    @appId      = ENV['FSappId']
    @appKey     = ENV['FSappKey']
  end

  def southwest_flights_from_denver
    parse(connection.get("v2/json/airport/status/DEN/dep/2015/11/8/12?appId=#{@appId}&appKey=#{@appKey}&utc=false&numHours=1&carrier=WN"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
