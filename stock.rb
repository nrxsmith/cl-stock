require 'open-uri'
require 'nokogiri'
require 'byebug'

class StockDisplayer

  def initialize
  end

  def scrape(ticker)
    d = DataLocator.new(ticker)
    url = d.perform
     
    html = open(url)
    page = Nokogiri::HTML(html)
    
    price = scan_for_price(page)
    change_pct = scan_for_pct(page)

    first_space = " " * (10 - ticker.length)
    second_space = " " * (10 - price.length)
   
    puts ticker + first_space + price + second_space + change_pct
  end

  def scan_for_price(page)
    price = ""
    page.css('.wsod_last span').each do |span|
      scanned_value = span.to_s.scan(/\d{0,2}\,?\d{3}\.\d{2}/).first
      price = scanned_value if scanned_value != nil 
    end
    price
  end

  def scan_for_pct(page)
    change_pct = ""
    page.css('.wsod_change').each do |span|
      scanned_pct = span.to_s.scan(/(?:\+?|-)\d{1,2}\.\d{2}%/).first
      change_pct = scanned_pct if scanned_pct != nil
    end
    change_pct
  end
end


class Scraper

end

class DataLocator

  INDICES = ["Dow",
             "S&P 500",
             "Nasdaq"]

  def initialize(ticker)
    @ticker = ticker 
  end

  def perform 
    if is_index?
      base_url = 'http://money.cnn.com/data/markets/'
      ticker_url = 'dow/' if @ticker == "Dow"
      ticker_url = 'sandp/' if @ticker == "S&P 500"
      ticker_url = 'nasdaq/' if @ticker == "Nasdaq"
    else
      base_url = 'http://money.cnn.com/quote/quote.html?symb='
      ticker_url = @ticker 
    end

    full_url = base_url + ticker_url
  end

  private

  def is_index?
    INDICES.include?(@ticker)
  end
end


s = StockDisplayer.new
s.scrape("Dow")
s.scrape("S&P 500")
s.scrape("Nasdaq")
s.scrape("AAPL")
