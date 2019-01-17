require 'pry'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open('https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes'))
commune_val = page.xpath('//*[@class="titre_normal"]')

tab_link = []
commune_val.each do |link|
  _tab = link.text # ou n'importe quelle autre opération de ton choix ;)
  tab_link << _tab
end

array = []

tab_link.map do |element|
  _array = element.gsub(/Mme/, '')
  array << _array
end

array_2 = []
array.map do |element_|
  array_ = element_.gsub(/M/, '')
  array_2 << array_
end

array_3 = []
array_2.map do |element_2|
  array_2b = element_2.gsub(/ /, '-')
  array_3 << array_2b

end

array_4 = []
array_3.each do |string|
   string[0] = ''
   array_4 << string
end





binding.pry
