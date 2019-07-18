require 'nokogiri'
require 'open-uri'


def get_townhall_email(townhall_url)
	
#LANCEMENT DE NOKOGIRI
page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/#{townhall_url}.html")) 

	email_adresses_city = page.xpath('//html/body/div[1]/main/section[2]/div/table/tbody/tr[4]/td[2]').text 
	return [email_adresses_city]
	
end 

#get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")

def get_townhall_urls
	
	nom_des_communes=[]
	email_des_communes=[]
	
page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/val-d-oise.html"))

page.xpath('//p/a[position()>=1 and position()<=last()]').each do |node|
	nom_des_communes.push(node.text) 
	email_des_communes.push(get_townhall_email(node.text.downcase.gsub(" ","-")))
end
	puts email_des_communes
end 

get_townhall_urls