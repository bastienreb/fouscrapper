require 'nokogiri'
require 'open-uri'

crypto_names = []
crypto_prices = []

array_crypto = []

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


page.xpath('(//tr[position()>=1 and position()<=last()]/td[2]/a)').each do |n|
crypto_names.push(n.text) 
end



page.xpath('(//tr[position()>=1 and position()<=last()]/td[5]/a)').each do |n|
crypto_prices.push(n.text)
end

crypto_names.length.times do |i|
	array_crypto[i] = {crypto_names[i] => crypto_prices[i]}
end

puts array_crypto[0]

