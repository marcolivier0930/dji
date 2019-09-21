# require 'pry'
# require 'nokogiri'
# require 'open-uri'
require_relative 'devices.rb'

class Scraper
    def self.scrape
        # devices names 
        doc = Nokogiri::HTML(open("https://store.dji.com/"))
        # doc.css('.index__section-item___1aGxi').css('.style__title___3zLsG').each do |devices|
        doc.css('.index__section-item___1aGxi').each do |info|
            hash = {
                name: info.css('.style__title___3zLsG').children.text,
                price: info.css('span')[1].text
            }
            # name = devices.children.text
            # name = doc.css('.index__section-item___1aGxi').css('h4.style__title___3zLsG').text
            # binding.pry
            Devices.new(hash)
        end
    end

end