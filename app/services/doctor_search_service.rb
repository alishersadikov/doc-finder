class DoctorSearchService
  def self.process(**args)
    new(args).process
  end

  class ApiConnectionError < RuntimeError; end
  attr_reader :name

  def initialize(name:)
    @name = name
  end

  def process
    fetch_doctors
  end

  private

  def fetch_doctors
    search_response = search_for_doctors
    parse(search_response.body)[:data]
  end

  def search_for_doctors
    connection.get do |req|
      req.params['user_key'] = ENV['API_KEY']
      req.params['name'] = @name
    end
  rescue Faraday::ConnectionFailed
    Rails.logger.error { "Failed to connect to the API" }
    raise ApiConnectionError
  end

  def connection
    @_connection ||= Faraday.new(url: base_uri) { |faraday| faraday.adapter Faraday.default_adapter }
  end

  def base_uri
    # Using URI object gives us a lot more robustness than a string
    URI(ENV['API_BASE_URL'])
  end

  def parse(body)
    JSON.parse(body, symbolize_names: true)
  end
end
