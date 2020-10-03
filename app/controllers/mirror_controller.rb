class MirrorController < ApplicationController
  def index
      @weather = get_weather
      unless @weather.nil?
          @max_temp = @weather['main']["temp_min"]
          @min_temp = @weather['main']["temp_max"]
          @temp = @weather['main']["temp"]
          @feels_like = @weather['main']["feels_like"]
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
    request_api(
      "http://api.openweathermap.org/data/2.5/weather?q=Meersburg&exclude=daily&units=metric&appid=082a03e1732d575e462eddb2dc705497"
    )
  end
end
