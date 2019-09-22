# did not need to require any gem since it's all called in the environment.rb
require_relative 'devices.rb'

class Scraper
    def self.scrape
        doc = Nokogiri::HTML(open("https://store.dji.com/"))
        doc.css('.index__section-item___1aGxi').each do |info|
            hash = {
                # the code below will get both the name and the price of the devices
                name: info.css('.style__title___3zLsG').children.text,
                price: info.css('span')[1].text
            }
            Devices.new(hash)
        end
    end
end