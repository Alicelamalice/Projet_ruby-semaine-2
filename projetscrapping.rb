require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pp'
  
def get_the_email_of_a_townhal_from_its_webpage(url_ville)

	page = Nokogiri::HTML(open(url_ville))
    
	email = page.css(".style27 .Style22")
	return email[5].text

 end

def get_all_the_urls_of_val_doise_townhalls

	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

	tous_les_urls = page.css('.lientxt')
	
	ville_mail = Hash.new(0)

	tous_les_urls.each do 
	
	|element|
	stock_url_incomplète = element["href"]
	stock_url_complète = "http://annuaire-des-mairies.com/" + stock_url_incomplète
	mail_mairie = get_the_email_of_a_townhal_from_its_webpage(stock_url_complète)
	ville_mail[element.text]=mail_mairie

    end
puts ville_mail

end

get_all_the_urls_of_val_doise_townhalls()
