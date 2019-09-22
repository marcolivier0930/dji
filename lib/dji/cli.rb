class CLI

    def run
        scrape
        welcome
    end

    def welcome
        puts "Welcome, you can see the devices name for DJI! ".colorize(:green)
        sleep 2
        print "All you have to do is type 'devices' to see the list of the devices we have and press 'Enter': ".colorize(:blue)
        input = gets.chomp
        if input == 'devices'
            show_devices
        elsif input == 'exit'
            puts "Come again!".colorize(:magenta)
            exit
        else
            puts "Invalid input".colorize(:red)
            welcome
        end
    end

    def show_devices
        puts "  Below is the list of the devices: ".colorize(:cyan)
        Devices.all.each.with_index do |device, i|
            # binding.pry
            puts "#{i + 1}. #{device.device_name}"
        end

        device_selection
    end

    def device_selection
        puts "  Type the number of the device you want to see the price and press 'Enter': ".colorize(:green)
        print " > "
        input = " "
        while input != "exit"
            input = gets.chomp

            if (1..36).include?(input.to_i)
                @chosen_device = Devices.all[input.to_i - 1]
                # binding.pry
                puts "    Name: ".colorize(:blue) + "#{@chosen_device.device_name}".colorize(:green)
                puts "    Price: ".colorize(:blue) + "#{@chosen_device.device_price}".colorize(:green)
                puts " "
                puts "Type 'devices' to show all devices: ".colorize(:green)
                puts "Type 'exit' to exit: ".colorize(:red)
                print " > "
            elsif input.downcase == 'devices'
                show_devices
            elsif input.downcase == "exit"
                puts "Hope you enjoyed! :)".colorize(:blue)
                break
            else
                puts "Wrong input! Please again!".colorize(:red)
                device_selection
            end
        end
        puts "Please, come again! :)".colorize(:magenta)
        exit
    end


    def scrape
        Scraper.scrape
    end

end