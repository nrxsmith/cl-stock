class Scraper

  attr_reader :price
  attr_reader :change_pct

  def initialize(page)
    @page = page
  end

  def perform
    @price = scan_for_price(@page)
    @change_pct = scan_for_pct(@page)
  end

  private

  def scan_for_price(page)
    price = ""
    page.css('.wsod_last span').each do |span|
      scanned_value = span.to_s.scan(/\d{0,2}\,?\d{0,3}\.\d{2}/).first
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

