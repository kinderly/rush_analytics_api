module RushAnalyticsApi
  class Request
    URL = 'http://www.api.rush-analytics.ru/api.php?wsdl'

    def initialize(action, message = {})
      @action = action
      @message = { 'hash' => ENV['rush_api_key'] }.merge(message)
    end

    def call
      @client = Savon.client(wsdl: URL)
      @client.call(@action, message: @message)
    end
  end
end
