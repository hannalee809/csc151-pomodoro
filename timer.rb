# Starter file for timer app
#$: << "."
require 'ruby2d'
require 'csv'
#require './settings.rb'


# def csv_check(file_name)
#     if(File.exist?(file_name))
#         puts 'file exists'
#     else 
#         puts 'file does not found'
#         CSV.open(file_name, mode 'w') do |csv|
#             csv << 
#         file_name = CSV.new(string_or_io, **options)
        
#     end
    
# end

# def csv_write(file_name, date, time, )
#     CSV.open(file_name, 'wb') do |csv|
#         csv << ['Date', 'Time', 'Pomodoro']
#         csv <<  [Time.new]
#     end
# end


# CSV.open('test.csv', 'wb') do |csv|
#     csv << ['Date', 'Time', 'Pomodoro']
#     csv <<  [Time.new]




# Set window title and size
set title: "Pomodoro Timer"
set width: 800
set height: 600
set background: '#F4EAE6'

# default timer before anything gets pressed
timer_num = '00:00'
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
timer_clock = Text.new("#{timer_num}", x: 320, y: 200, size: 75)
settings_text = Text.new('Settings', x: 700, y: 10, size: 20, color: '#4297A0')

def settings(pom_num, long_break, short_break)
    # set title: "Settings"
    # set width: 800
    # set height: 600
    # set background: '#F4EAE6'
    
    # draw out settings' elements
    settings_box = Rectangle.new(x: 10, y: 125, width: 180, height: 300, color: '#4297A0')
    time_text = Text.new('Time (minutes)', x: 15, y: 130, size: 25)
    exit_button = Rectangle.new(x: 175, y: 125, width: 15, height: 15, color: 'red')
    exit_text = Text.new('X', x: 175, y: 125, size: 15)

    pom_text = Text.new('Pomodoro:', x: 15, y: 185, size: 15)
    short_text = Text.new('Short Break:', x: 15, y: 235, size: 15)
    long_text = Text.new('Long Break:', x: 15, y: 285, size: 15)

    alarm_text = Text.new('Alarm Sound', x: 15, y: 335, size: 25)

    puts 'Enter an amount of minutes for Pomodoro timer:'
    pom_num = gets.chomp.to_i

    puts 'Enter an amount of minutes for short break:'
    short_break = gets.chomp.to_i

    puts 'Enter an amoung of minutes for long break:'
    long_break = gets.chomp.to_i

    settings_on_off = false
    
    #  on :mouse_down do |event|
    #     if pom_text.contains?(event.x, event.y)
    #         puts 'Enter an amount of minutes for Pomodoro timer:'
    #         pom_num = gets.chomp.to_i
    #         return pom_num
    #     end

    #     if short_text.contains?(event.x, event.y)
    #         puts 'Enter an amount of minutes for short break:'
    #         short_break = gets.chomp.to_i
    #         return short_break
    #     end

    #     if long_text.contains?(event.x, event.y)
    #         puts 'Enter an amoung of minutes for long break:'
    #         long_break = gets.chomp.to_i
    #         return long_break
    #     end

    #     if alarm_text.contains?(event.x, event.y)
    #         puts 'Enter an alarm sound from this list:...'
    #         alarm_sound = gets
    #         alarm_sound = alarm_sound.chomp
    #     end
    # end

end
# timer class
#class Timer
    
    # start timer, might need to get rid of this if this code is in the update do part
    # def timer_start(len)
    #     t = Time.new(0)
    #     countdown_time_in_seconds = len # pomodoro len = 1500, short break = 300, long break = 900
        
    #     countdown_time_in_seconds.downto(0) do |seconds|
    #       timer_num =  (t + seconds).strftime('%M:%S')
    #       sleep 1
    #       puts timer_num
    #     #   $timer_clock.remove
    #       timer_clock = Text.new("#{timer_num}", x: 320, y: 200, size: 75)
    #     end
    
    # end

    # stop timer
#     def timer_stop()

#     end

#     # save timer length for when it is the 'pomodoro'

# end

on :mouse_down do |event|

    # if pomodoro text clicked - len is 1500
    if pom_text.contains? event.x, event.y
       puts "Pomodoro" 
       timer_len = 1500
       pomodoro_on_off = true
    end

    # if short break clicked - len is 300
    if short_text.contains? event.x, event.y
        puts "Short Break"
        #Timer.new.timer_start(len = 300)
        timer_len = 300
    end

    # if long break clicked - len is 900
    if long_text.contains? event.x, event.y
        puts "Long break"
        timer_len = 900
    end

    if start_text.contains? event.x, event.y
        puts timer_len
        timer_on_off = true
    end
 
    if stop_text.contains? event.x, event.y
        stop_timer = true
        timer_on_off = false
    end

    if settings_text.contains? event.x, event.y
        puts "settings clicked"
        settings_on_off = true
        

    end
end

update do
    if timer_on_off == true
        puts 'start has been pressed'

        # creates the time instance for the csv file
        csv_time = Time.now
        puts csv_time
        

        # for the countdown
        t = Time.new(0)
        timer_num = timer_len
        timer_len.downto(0) do |seconds|
          timer_num =  (t + seconds).strftime('%M:%S')
           sleep 1
        #   timer_clock.text = "#{timer_num}"
          puts timer_num
          break if stop_timer == true

        end
        timer_on_off = false


        # stores the pomodoro time and the date into the csv array - will be converted to a csv file soon
        if pomodoro_on_off == true
            csv_pomodoro = timer_len
            puts "csv_pomodoro is #{csv_pomodoro}"
            csv_array << [csv_time, csv_pomodoro]
            puts csv_array

        else
            puts "because this was a short/break, this will not be recorded"
        end
      
    end
    if settings_on_off == true
        settings(15, 15, 15) 
        break if settings_on_off == false
        puts pom_num
        puts short_break
        puts long_break
    end
end

show
