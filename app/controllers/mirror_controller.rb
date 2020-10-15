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
    @news_german = get_news('Deutschland')
    #@news_lithuania = get_news('Litauen')
    @news_economics = get_news('Wirtschaft')


# %iframe{:frameborder => "0", :height => "600", :scrolling => "no", :src => "https://calendar.google.com/calendar/embed?src=gintare.lideikyte%40googlemail.com&ctz=Europe%2FBerlin", :style => "border: 0", :width => "800"}
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

  require 'net/http'
  def get_news(search)
    api_key = Rails.application.credentials.api_key_news
    date = DateTime.now.strftime('%Y-%m-%d')
    uri = URI("http://newsapi.org/v2/everything?q=#{search}&from=#{date}&sortBy=publishedAt&apiKey=#{api_key}")
    res = Net::HTTP.get_response(uri)

    JSON.parse(res.body)
  end
end
