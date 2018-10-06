require_relative '../lib/displayer.rb'

current_path = File.dirname(__FILE__)
CONFIG_PATH = File.join(current_path, '../config/tickers.txt')

s = StockDisplayer.new

File.foreach(CONFIG_PATH) {|t| s.perform(t.chomp) }

