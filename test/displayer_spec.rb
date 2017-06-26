require 'minitest/autorun'
require '../lib/displayer'
require 'byebug'
class TestStockDisplayer < Minitest::Test

  def setup
    @displayer = StockDisplayer.new
  end

  def test_includes_dow
    assert_match (/.*Dow.*/), @displayer.perform("Dow")
  end
end
