class DelayIndexService
  attr_reader :connection

  def initialize
    @connection   = Hurley::Client.new("https://api.flightstats.com/flex/delayindex/rest/")
    @appId        = ENV['FSappId']
    @appKey       = ENV['FSappKey']
  end

  def delay_index_api
    parse(connection.get("v1/json/airports/DEN?appId=#{@appId}&appKey=#{@appKey}"))
  end

  def normalized_score
    delay_index_api[:delayIndexes].first[:normalizedScore]
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
