# Starter file for timer app
#$: << "."
require 'ruby2d'
require 'csv'
#require './settings.rb'


def csv_check(file_name, array)
    if(File.exist?(file_name))
        puts 'file exists'
        CSV.open(file_name, "a") do |csv|
            array.each do |pomtime|
                csv << pomtime
            end
        end
    else 
        puts 'file does not found'
        headers = ["Timestamp", "PomodoroLength"]
        CSV.open(file_name, "w") do |csv|
            csv << headers
            array.each do |pomtime|
                csv << pomtime
            end
        end
        
    end
    
end

# Set window title and size
set title: "Pomodoro Timer"
set width: 800
set height: 600
set background: '#F4EAE6'

# default timer before anything gets pressed
timer_num = '00:00:00'
timer_len = 0
timer_on_off = false
pomodoro_on_off = false
stop_timer = false
settings_on_off = false
csv_array = Array.new

# default values for timer settings
pom_num = 15
short_break = 15
long_break = 15


# draw out timer elements
Rectangle.new(x: 200, y: 125, width: 400, height: 300, color: '#E57F84')
start_box = Rectangle.new(x: 230, y: 300, width: 150, height: 75, color: '#4297A0')
start_text = Text.new('Start', x: 250, y: 300, size: 50)
stop_box = Rectangle.new(x: 420, y: 300, width: 150, height: 75, color: '#4297A0')
stop_text = Text.new('Stop', x: 440, y: 300, size: 50)
pom_text = Text.new('Pomodoro', x: 225, y: 130, size: 20)
short_text = Text.new('Short Break', x: 350, y: 130, size: 20)
long_text = Text.new('Long Break', x: 475, y: 130, size: 20)
timer_clock = Text.new("#{timer_num}", x: 260, y: 200, size: 75)
settings_text = Text.new('Settings', x: 700, y: 10, size: 20, color: '#4297A0')


def seconds_to_hms(sec)
    "%02d:%02d:%02d" % [sec / 3600, sec / 60 % 60, sec % 60]
end

on :mouse_down do |event|

    # if pomodoro text clicked - len is 1500
    if pom_text.contains? event.x, event.y
       puts "Pomodoro" 
       timer_len = 1500
       pomodoro_on_off = true
       timer_clock.text = seconds_to_hms(1500)
    end

    # if short break clicked - len is 300
    if short_text.contains? event.x, event.y
        puts "Short Break"
        #Timer.new.timer_start(len = 300)
        timer_len = 300
        timer_clock.text = seconds_to_hms(300)

    end

    # if long break clicked - len is 900
    if long_text.contains? event.x, event.y
        puts "Long break"
        timer_len = 900
        timer_clock.text = seconds_to_hms(900)

    end

    if start_text.contains? event.x, event.y
        puts timer_len
        timer_on_off = true
    end
 
    if stop_text.contains? event.x, event.y
        stop_timer = true
        timer_on_off = false
        csv_array.pop
    end

    if settings_text.contains? event.x, event.y
        puts "settings clicked"
        settings_on_off = true
        

    end
end

tick = 0
update do
    if timer_on_off == true

        # creates the time instance for the csv file
        csv_time = Time.now
        

        # for the countdown
        t = Time.new(0)
        if timer_len == 0
            timer_on_off == false
        else
            if tick % 60 == 0
                timer_len -= 1
                timer_clock.text = seconds_to_hms(timer_len)
            end
            tick += 1
        end


        # stores the pomodoro time and the date into the csv array - will be converted to a csv file soon
        if pomodoro_on_off == true
            csv_pomodoro = timer_len
            # puts "csv_pomodoro is #{csv_pomodoro}"
            csv_array << [csv_time, csv_pomodoro]
            # puts csv_array
            csv_check("pomodoro.csv", csv_array)
            csv_array.pop
            pomodoro_on_off = false
        end
      
    end

    # if settings text is clicked, the user can choose to change the time for pomodoro, short break, or long break
    if settings_on_off == true
        print 'Would you like to change the length of the Pomodoro timer, short break, or long break? ' 
        input = gets.chomp

        if input == "Pomodoro"
            print "Enter an amount of minutes for Pomodoro timer: "
            timer_len = gets.chomp.to_i
            pomodoro_on_off = true
        end

        if input == "Short break"
            print "Enter the amount of minutes for Short break: "
            timer_len = gets.chomp.to_i
        end

        if input == "Long break"
            print "Enter the amount of minutes for Long break: "
            timer_len = gets.chomp.to_i
        end
        timer_on_off = true
        settings_on_off = false
    end
        
end

show
