class DenverSouthwestWorker
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://api.flightstats.com/flex/flightstatus/rest/")
    @appId      = ENV['FSappId']
    @appKey     = ENV['FSappKey']
  end

  def southwest_flights_from_denver
    if end_of_day && first_day_of_month
      parse(connection.get("v2/json/airport/status/DEN/dep/#{Time.now.year}/#{adjusted_end_of_day_time_month}/#{adjusted_end_of_day_time_day}/#{adjusted_end_of_day_time_hour}?appId=#{@appId}&appKey=#{@appKey}&utc=false&numHours=1&carrier=WN"))
    elsif end_of_day
      parse(connection.get("v2/json/airport/status/DEN/dep/#{Time.now.year}/#{Time.now.month}/#{adjusted_end_of_day_time_day}/#{adjusted_end_of_day_time_hour}?appId=#{@appId}&appKey=#{@appKey}&utc=false&numHours=1&carrier=WN"))
    else
      parse(connection.get("v2/json/airport/status/DEN/dep/#{Time.now.year}/#{Time.now.month}/#{Time.now.day}/#{adjusted_end_of_day_time_hour}?appId=#{@appId}&appKey=#{@appKey}&utc=false&numHours=1&carrier=WN"))
    end
  end

  private

  def adjusted_end_of_day_time_hour
    (Time.now - 1.hour).hour
  end

  def adjusted_end_of_day_time_day
    (Time.now - 1.day).day
  end

  def adjusted_end_of_day_time_month
    (Time.now - 1.month).month
  end

  def end_of_day
    (Time.now.hour == 0)
  end

  def first_day_of_month
    (Time.now.day == 1)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
