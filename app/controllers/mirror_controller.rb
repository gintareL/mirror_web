class MirrorController < ApplicationController
  include ApplicationHelper
  def index
    @word = Word.find(rand(1..Word.maximum(:id)))
      @weather = get_weather
      unless @weather.nil?
          @max_temp = @weather['main']["temp_max"].to_i
          @min_temp = @weather['main']["temp_min"].to_i
          @temp = @weather['main']["temp"].to_i
          @feels_like = @weather['main']["feels_like"].to_i
          @image = @weather['weather'].first['icon']
      else
      
      end

  end
  
  private
  def request_api(url)
    response = Excon.get(
      url,
      headers: {
        'X-RapidAPI-Host' => URI.parse(url).host,
        #'X-RapidAPI-Key' => ENV.fetch('082a03e1732d575e462eddb2dc705497')
      }
    )
    return nil if response.status != 200
    JSON.parse(response.body)
  end
  
  def get_weather
    logger.info('get_weather')
    api_key = Rails.application.credentials.api_key
    request_api(
      "http://api.openweathermap.org/data/2.5/weather?q=Meersburg&exclude=daily&units=metric&appid=#{api_key}"
    )
  end

  def create_service_auth
    #create service auth
    @service = Google::Apis::CalendarV3::CalendarService.new
    @service.authorization = token.google_secret.to_authorization
    return unless token.expired?

    new_access_token = @service.authorization.refresh! #refresh access_token
  end
end
