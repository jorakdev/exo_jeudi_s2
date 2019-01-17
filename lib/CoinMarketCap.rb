require 'pry'
require 'nokogiri'
require 'open-uri'
def coinmarketcap
  page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  _symbol = page.xpath('//*[@class="text-left col-symbol"]')

  tab = []
  _symbol.each do |email_link|
    _tab = email_link.text # ou n'importe quelle autre opération de ton choix ;)
    tab << _tab
  end

  page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  _price = page.xpath('//*[@class="price"]')

  tab_p = []
  _price.each do |_price_link|
    _tab_p = _price_link.text
    tab_p << _tab_p
  end

  tab_a = []
  tab_p.each do |xd|
    a = xd.delete('$')

    tab_a << a.to_f
  end

  c = Hash[tab.zip(tab_a)]
end
