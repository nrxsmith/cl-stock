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
