class CLI

    def run
        scrape
        welcome
    end

    def welcome
        puts "Welcome, you can see the devices name for DJI: ".colorize(:green)
        sleep 2
        print "All you have to do is type 'devices' and press Enter: ".colorize(:green)
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
             puts "    Price: #{device.device_price}"
        end

        device_selection
    end

    def device_selection
        puts "Type the number and press Enter: ".colorize(:green)
        input = " "
        while input != "exit"
            input = gets.chomp

            if (1..36).include?(input.to_i)
                @chosen_device = Devices.all[input.to_i]
                puts "    Price: #{@chosen_device.device_price}"
                puts " "
                puts "Type 'devices' to show all devices: ".colorize(:green)
                puts " "
                puts "Type 'exit' to exit".colorize("red")
            elsif input.downcase == 'devices'
                show_devices
            elsif input.downcase == "exit"
                puts "Hope you enjoyed! :)".colorize(:blue)
                break
            else
                puts "Error! Please again!".colorize(:red)
                device_selection
            end
        end
        puts "Come again! ;)".colorize(:magenta)
        exit
    end


    def scrape
        Scraper.scrape
    end

end