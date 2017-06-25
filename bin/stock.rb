require_relative '../lib/displayer.rb'

s = StockDisplayer.new
s.perform("Dow")
s.perform("S&P 500")
s.perform("Nasdaq")
s.perform("AAPL")
