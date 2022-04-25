# Pomodoro Timer App
This is an application that helps the user utilize the Pomodoro Method to focus and get their task(s) down. Along with the timer aspect, this application also creates a data visualization so that the user can track how long they have been working and taking breaks each day.


## Launch the application

This application uses both Ruby (v. 3.1.1p18) for the actual app and R/RStudio (v. 4.1.1) for the data visualzations. 
 
After installing Ruby, install the Ruby 2D gem. On the command line, run: 

Code: gem install ruby2d

After installing R and RStudio, install the necessary packages ggplot2, tidyverse, and lubridate

Code: install.packages(“ggplot2”)
install.packages(“tidyverse”)
install.packages(“lubridate”)

In order to launch the app, make sure that the current directory is the same as the directory of this application. Then run:

Code: ruby timer.rb
