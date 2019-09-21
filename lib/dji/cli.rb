class CLI

    def run
        scrape
        welcome
    end

    def welcome
        puts "Welcome, you can see the devices name for DJI: ".colorize(:green)
        sleep 2
        puts "All you have to do is type 'devices': ".colorize(:green)
        input = gets.chomp
        if input == 'devices'
            show_devices
        else
            puts "Invalid input"
            welcome
        end
    end

    def show_devices
        Devices.all.each.with_index do |device, i|
           # binding.pry
            puts "#{i + 1}. #{device.device_name}"
        end
    end

    def scrape
        Scraper.scrape
    end

end