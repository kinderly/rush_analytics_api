module RushAnalyticsApi
  class Request
    URL = 'http://www.api.rush-analytics.ru/api.php?wsdl'

    def initialize(action, api_key = nil, message = {})
      @action = action
      @api_key = api_key || ENV['rush_api_key']
      @message = { 'hash' => @api_key }.merge(message)
    end

    def call
      @client = Savon.client(wsdl: URL, log_level: :debug, pretty_print_xml: true, log: true)
      @client.call(@action, message: @message)
    end
  end
end
