# Starter file for timer app
require 'ruby2d'

# Set window title and size
set title: "Pomodoro Timer"
set width: 800
set height: 600
set background: '#F4EAE6'

timer_num = Time.new(0)

# draw out timer elements
Rectangle.new(x: 200, y: 125, width: 400, height: 300, color: '#E57F84')
start_box = Rectangle.new(x: 300, y: 300, width: 200, height: 75, color: '#4297A0')
start_text = Text.new('Start', x: 320, y: 300, size: 50)
pom_text = Text.new('Pomodoro', x: 225, y: 130, size: 20)
short_text = Text.new('Short Break', x: 350, y: 130, size: 20)
long_text = Text.new('Long Break', x: 475, y: 130, size: 20)
timer_clock = Text.new("#{timer_num}", x: 320, y: 200, size: 75)

# timer class
class Timer
    
    # start timer
    def timer_start
        countdown_time_in_seconds = 1500

        countdown_time_in_seconds.downto(0) do |seconds|
            puts (timer_num + seconds).strftime('%M:%S')

        end
    
    end

    # stop timer
    def timer_stop()

    end

    # save timer length for when it is the 'pomodoro'

end
# Load and position timer screen

on :mouse_down do |event|

    # if pomodoro text clicked
    if pom_text.contains? event.x, event.y
       puts "Pomodoro" 
        Timer.timer_start
    end

    # if short break clicked
    if short_text.contains? event.x, event.y
        puts "Short Break"
    end

    # if long break clicked
    if long_text.contains? event.x, event.y
        puts "Long break"
    end

end
show
