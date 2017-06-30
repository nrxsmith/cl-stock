require 'open-uri'
require 'nokogiri'
require_relative 'scraper'
require_relative 'data_locator'
require 'colored'

class StockDisplayer

  def initialize
  end

  def perform(ticker)
    d = DataLocator.new(ticker)
    url = d.perform
     
    html = open(url)
    page = Nokogiri::HTML(html)
    s = Scraper.new(page)
    s.perform

    first_space = " " * (10 - ticker.length)
    second_space = " " * (10 - s.price.length)
   
    display = ticker + first_space + s.price + second_space + s.change_pct
    puts display.red if s.change_pct.to_f < 0
    puts display.green if s.change_pct.to_f > 0
    puts display if s.change_pct.to_f == 0
  end
 
end
