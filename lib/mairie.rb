require 'pry'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
commune_val = page.xpath('//*[@class="lientxt"]')

tab_link = []
commune_val.each do |link|
  _tab = link.text # ou n'importe quelle autre opération de ton choix ;)
  tab_link << _tab
end

new = []
tab_link.each do |elm_tab|
  _new = elm_tab.tr(' ', '-')
  new << _new
end

town = []
new.each do |down|
  _town = down.downcase
  town << _town
end

mail_commune_val = []
town.each do |nom_ville|
  page_95 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/#{nom_ville}.html"))
  _mail_commune_val = page_95.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
  mail_commune_val << _mail_commune_val
end

tab = []
mail_commune_val.each do |email_link|
  _tab = email_link.text # ou n'importe quelle autre opération de ton choix ;)
  tab << _tab
end

# town.each do |n|
# puts ("http://annuaire-des-mairies.com/95/#{n}.html")
# end
a = Hash[tab_link.zip(tab)]

binding.pry
