require 'net/http'
require 'json'

class Product < ApplicationRecord
    monetize :price_cents, as: 'price'


    def self.price_by_geolocation(user_ip)
        url = "https://v3.exchangerate-api.com/local/ed1b70c851f03f4ec7abfb8f/"+Money.default_currency.iso_code+"/"+ user_ip
        uri = URI(url)
        response = Net::HTTP.get(uri)
        response_obj = JSON.parse(response)
        
        if response_obj["result"] == "success" && Money.default_currency.iso_code != response_obj["to"]
            Money.default_bank.add_rate(Money.default_currency.iso_code, response_obj["to"], response_obj["rate"])
        end
    end
    
end
