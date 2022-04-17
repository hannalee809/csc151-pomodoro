require 'ruby2d'


def settings 
    set title: "Settings"
    set width: 800
    set height: 600
    set background: '#F4EAE6'


    # draw out settings' elements
    settings_box = Rectangle.new(x: 250, y: 50, width: 300, height: 500, color: '#4297A0')
    time_text = Text.new('Time (minutes)', x: 255, y: 55, size: 40)
    exit_button = Rectangle.new(x: 530, y: 50, width: 20, height: 20, color: 'red')
    exit_text = Text.new('X', x: 535, y: 45, size: 20)

    pom_text = Text.new('Pomodoro:', x: 255, y: 125, size: 20)
    short_text = Text.new('Short Break:', x: 255, y: 175, size: 20)
    long_text = Text.new('Long Break:', x: 255, y: 225, size: 20)

    alarm_text = Text.new('Alarm Sound', x: 255, y: 275, size: 40)

    on :mouse_down do |event|
        if pom_text.contains?(event.x, event.y)
            puts 'Enter an amount of minutes for Pomodoro timer:'
            pom_num = gets
            pom_num = pom_num.chomp
        end
        if short_text.contains?(event.x, event.y)
            puts 'Enter an amount of minutes for short break:'
            short_break = gets
            short_break = short_break.chomp
        end

        if long_text.contains?(event.x, event.y)
            puts 'Enter an amoung of minutes for long break:'
            long_break = gets
            long_break = long_break.chomp
        end

        if alarm_text.contains?(event.x, event.y)
            puts 'Enter an alarm sound from this list:...'
            alarm_sound = gets
            alarm_sound = alarm_sound.chomp
        end
    end

end

show
