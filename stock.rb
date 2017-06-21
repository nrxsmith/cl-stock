require 'open-uri'
require 'nokogiri'

class StockDisplayer

  def initialize
  end

  def self.scrape(index)
    price = ""
    change_pct = ""

    base_url = 'http://money.cnn.com/data/markets/'
    index_url = 'dow/' if index == "Dow"
    index_url = 'sandp/' if index == "S&P 500"
    index_url = 'nasdaq/' if index == "Nasdaq"

    full_url = base_url + index_url
 
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

  def self.get_index(index)
  end
end

StockDisplayer.scrape("Dow")
StockDisplayer.scrape("S&P 500")
StockDisplayer.scrape("Nasdaq")
