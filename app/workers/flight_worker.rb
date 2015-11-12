class FlightWorker
  attr_reader :connection, :airport_code, :airline_code

  def initialize(airport_code, airline_code)
    @connection   = Hurley::Client.new("https://api.flightstats.com/flex/flightstatus/rest/")
    @appId        = ENV['FSappId']
    @appKey       = ENV['FSappKey']
    @airport_code = airport_code
    @airline_code = airline_code
  end

  def offset
    {ec: 1, cc: 0, mt: -1, pc: -2}
  end

  def api_offset_time(time_zone)
    offset_time = Time.now + offset[time_zone].hours
    api(offset_time)
  end

  def api(offset_time)
    parse(connection.get("v2/json/airport/status/#{airport_code}/dep/#{offset_time.year}/#{offset_time.month}/#{offset_time.day}/#{offset_time.hour}?appId=#{@appId}&appKey=#{@appKey}&utc=false&numHours=1&carrier=#{airline_code}"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
