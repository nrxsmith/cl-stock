require_relative '../lib/displayer.rb'

CONFIG_PATH = '/home/nate/code/personal/stock/config/tickers.txt'

s = StockDisplayer.new

File.foreach(CONFIG_PATH) {|t| s.perform(t.chomp) }

# tickers = ["Dow",
#           "S&P 500",
#           "Nasdaq",
#           "BND",
#           "VXUS"]

# tickers.each do |t|
#  s.perform(t)
# end

