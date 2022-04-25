# Pomodoro Timer App
This is an application that helps the user utilize the Pomodoro Method to focus and get their task(s) down. Along with the timer aspect, this application also creates a data visualization so that the user can track how long they have been working and taking breaks each day.

<img width="500" alt="pomodoroimage" src="https://user-images.githubusercontent.com/72512219/165003265-85740af0-ed73-4fd2-8a58-22b5765516e6.png">              <img width="500" alt="datavisimage" src="https://user-images.githubusercontent.com/72512219/165003274-d33052e7-c62e-49cd-ac24-678dbfe5d1ae.png">


## Launch the application

This application uses both Ruby (v. 3.1.1p18) for the actual app and R/RStudio (v. 4.1.1) for the data visualzations. 
 
After installing Ruby, install the Ruby 2D gem. On the command line, run: 

```
gem install ruby2d
```

After installing R and RStudio, install the necessary packages ggplot2, tidyverse, and lubridate in RStudio.

```
install.packages(“ggplot2”)
install.packages(“tidyverse”)
install.packages(“lubridate”)
```

In order to launch the app, make sure that the current directory is the same as the directory of this application. Then run:

```
ruby timer.rb
```
