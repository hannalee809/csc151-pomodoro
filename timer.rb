# Starter file for timer app
require 'ruby2d'

# Set window title and size
set title: "Pomodoro Timer"
set width: 800
set height: 600
set background: '#F4EAE6'

timer_num = Time.new(0)
timer_len = 0

# draw out timer elements
Rectangle.new(x: 200, y: 125, width: 400, height: 300, color: '#E57F84')
start_box = Rectangle.new(x: 300, y: 300, width: 200, height: 75, color: '#4297A0')
start_text = Text.new('Start', x: 320, y: 300, size: 50)
pom_text = Text.new('Pomodoro', x: 225, y: 130, size: 20)
short_text = Text.new('Short Break', x: 350, y: 130, size: 20)
long_text = Text.new('Long Break', x: 475, y: 130, size: 20)
timer_clock = Text.new("#{timer_num}", x: 320, y: 200, size: 75)

timer_on_off = false

# timer class
class Timer
    
    # start timer
    def timer_start(len)
        t = Time.new(0)
        countdown_time_in_seconds = len # pomodoro len = 1500, short break = 300, long break = 900
        
        countdown_time_in_seconds.downto(0) do |seconds|
          timer_num =  (t + seconds).strftime('%M:%S')
          sleep 1
          puts timer_num
        #   $timer_clock.remove
          timer_clock = Text.new("#{timer_num}", x: 320, y: 200, size: 75)
        end
    
    end

    # stop timer
    def timer_stop()

    end

    # save timer length for when it is the 'pomodoro'

end
# Load and position timer screen
update do 
    # puts "test"
    if timer_on_off == true
        Timer.new.timer_start(len = timer_len)
        timer_on_off = false
    end

    # remove the timer clock
    # timer_clock.remove
    # timer_clock = Text.new("#{timer_num}", x: 320, y: 200, size: 75)
end

on :mouse_down do |event|

    # if pomodoro text clicked
    if pom_text.contains? event.x, event.y
       puts "Pomodoro" 

       timer_len = 1500
    end

    # if short break clicked
    if short_text.contains? event.x, event.y
        puts "Short Break"
        #Timer.new.timer_start(len = )
        timer_len = 15
    end

    # if long break clicked
    if long_text.contains? event.x, event.y
        puts "Long break"
        timer_len = 900
    end

    if start_text.contains? event.x, event.y
        puts timer_len
        timer_on_off = true
       # Timer.new.timer_start(len = timer_len)
    end

end
show
