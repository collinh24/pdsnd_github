ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

library(ggplot2)

ny_1 = read.csv('new_york_city.csv', na.strings=c("", "NA"))
chi_1 = read.csv('chicago.csv', na.strings=c("", "NA"))

ggplot(data=wash, aes(x=Start.Station)) +
  geom_bar(width=1) +
  scale_y_continuous(breaks = seq(0, 2000, 250)) +
  ggtitle('Most Common Bike Share Start Station in Washington, D.C.') +
  xlab('Start Station') +
  ylab('Number of Times Each Station was Starting Point')

summary(wash)

ggplot(data=ny, aes(x=Start.Station)) +
  geom_bar(width=1) +
  scale_y_continuous(breaks = seq(0, 600, 75)) +
  ggtitle('Most Common Bike Share Start Station in New York City') +
  xlab('Start Station') +
  ylab('Number of Times Each Station was Starting Point')

summary(ny)

ggplot(data=chi, aes(x=Start.Station)) +
  geom_bar(width=1) +
  scale_y_continuous(breaks = seq(0, 250, 50)) +
  ggtitle('Most Common Bike Share Start Station in Chicago') +
  xlab('Start Station') +
  ylab('Number of Times Each Station was Starting Point')

summary(chi)

qplot(y = Trip.Duration, x = Gender,
      data = subset(chi_1, !is.na(Gender)),
      geom = 'boxplot') +
  coord_cartesian(ylim = c(0, 1000)) +
  ggtitle('Chicago Bike Share Travel Time; Males Vs. Females') +
  xlab('Gender') +
  ylab('Travel Time')

by(chi$Trip.Duration, chi$Gender, summary)

qplot(y = Trip.Duration, x = Gender,
      data = subset(ny_1, !is.na(Gender)),
      geom = 'boxplot') +
  coord_cartesian(ylim = c(0, 1100)) +
  ggtitle('New York Bike Share Travel Time; Males Vs. Females') +
  xlab('Gender') +
  ylab('Travel Time')

by(ny_1$Trip.Duration, ny_1$Gender, summary)

ggplot(aes(x = Birth.Year, y = Trip.Duration), data = ny) +
  geom_jitter(alpha = 1/5, color = 'blue') + 
  coord_cartesian(xlim = c(1940, 2000), ylim = c(60, 10800)) + 
  scale_x_continuous(breaks = seq(1940, 2000, 10)) +
  scale_y_continuous(breaks = seq(60, 10800, 1800)) +
  geom_line(stat = 'summary', fun.y = mean) +
  ggtitle('Trip Duration by Age in New York City') +
  xlab('Birth Year') +
  ylab('Trip Duration (Seconds)')

mean(ny[["Trip.Duration"]], na.rm=TRUE)

ggplot(aes(x = Birth.Year, y = Trip.Duration), data = chi) +
  geom_jitter(alpha = 1/5, color = 'blue') + 
  coord_cartesian(xlim = c(1940, 2000), ylim = c(60, 10800)) + 
  scale_x_continuous(breaks = seq(1940, 2000, 10)) +
  geom_line(stat = 'summary', fun.y = mean) +
  ggtitle('Trip Duration by Age in Chicago') +
  xlab('Birth Year') +
  ylab('Trip Duration (Seconds)')

mean(chi[["Trip.Duration"]], na.rm=TRUE)

system('python -m nbconvert Explore_bikeshare_data.ipynb')