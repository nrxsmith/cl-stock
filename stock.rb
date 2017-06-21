require 'open-uri'
require 'nokogiri'

class StockDisplayer

  def initialize
  end

  def scrape(index)
    price = ""
    change_pct = ""

    full_url = get_url(index)
 
    html = open(full_url)
    page = Nokogiri::HTML(html)
  
    page.css('.wsod_last.wsod_lastIndex span').each do |span|
      scanned_value = span.to_s.scan(/\d{1,2}\,\d{3}\.\d{2}/).first
      price = scanned_value if scanned_value != nil 
    end

    page.css('.wsod_change').each do |span|
      scanned_pct = span.to_s.scan(/(?:\+?|-)\d{1,2}\.\d{2}%/).first
      change_pct = scanned_pct if scanned_pct != nil
    end

    puts index + ": " + price + " " + change_pct
  end

  def get_url(index)
    base_url = 'http://money.cnn.com/data/markets/'
    index_url = 'dow/' if index == "Dow"
    index_url = 'sandp/' if index == "S&P 500"
    index_url = 'nasdaq/' if index == "Nasdaq"

    full_url = base_url + index_url
 end

  def get_index(index)
  end

  def get_stock(index)
  end 
end

s = StockDisplayer.new
s.scrape("Dow")
s.scrape("S&P 500")
s.scrape("Nasdaq")
