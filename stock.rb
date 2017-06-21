require 'open-uri'
require 'nokogiri'

class StockDisplayer

  def initialize
  end

  def scrape(ticker, index = nil)

    price = ""
    change_pct = ""

    full_url = build_url(ticker, index)
 
    html = open(full_url)
    page = Nokogiri::HTML(html)
    
    page.css('.wsod_last span').each do |span|
      scanned_value = span.to_s.scan(/\d{0,2}\,?\d{3}\.\d{2}/).first
      price = scanned_value if scanned_value != nil 
    end

    page.css('.wsod_change').each do |span|
      scanned_pct = span.to_s.scan(/(?:\+?|-)\d{1,2}\.\d{2}%/).first
      change_pct = scanned_pct if scanned_pct != nil
    end

    puts ticker + ": " + price + " " + change_pct
  end

  def build_url(ticker, index = nil)
    if index == true
      base_url = 'http://money.cnn.com/data/markets/'
    else
      base_url = 'http://money.cnn.com/quote/quote.html?symb='
    end

    ticker_url = 'dow/' if ticker == "Dow"
    ticker_url = 'sandp/' if ticker == "S&P 500"
    ticker_url = 'nasdaq/' if ticker == "Nasdaq"
    ticker_url = ticker if index == nil

    full_url = base_url + ticker_url
 end

  def get_index(index)
  end

  def get_stock(index)
  end 
end

s = StockDisplayer.new
s.scrape("Dow", true)
s.scrape("S&P 500", true)
s.scrape("Nasdaq", true)
s.scrape("AAPL")
