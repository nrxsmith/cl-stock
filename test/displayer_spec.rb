require 'minitest/autorun'
require '../lib/displayer'
require 'byebug'
class TestStockDisplayer < Minitest::Test

  def setup
    @displayer = StockDisplayer.new
  end

  def test_includes_dow
    assert_output (/.*Dow.*/) { @displayer.perform("Dow") }
  end
end
