class ProfilumApi
  API_HOST = 'dev.profilum.ru'

  attr_reader :token, :email

  # @param [String] email
  def initialize(email)
    @app_id = ENV['PROFILUM_APP_ID']
    @secret = ENV['PROFILUM_SECRET']
    @email  = email
    receive_token
  end

  private

  def receive_token
    # require 'open-uri'
    # response = open(url()).read
    # json     = JSON.parse(response)
    # @token   = json['token']

    require 'net/http'

    uri = URI(api_url("token?username=#{@email}"))
    Rails.logger.info("Profilum API request: #{uri}")

    options = {
      use_ssl:     uri.scheme == 'https',
      verify_mode: OpenSSL::SSL::VERIFY_NONE
    }

    Net::HTTP.start(uri.host, uri.port, options) do |http|
      request = Net::HTTP::Get.new uri.request_uri
      request.basic_auth @app_id, @secret

      response = http.request request # Net::HTTPResponse object
      json     = JSON.parse(response.body)
      @token   = json['token']
    end
  end

  # @param [String] path
  def api_url(path)
    "https://#{API_HOST}/api/#{path}"
  end
end
