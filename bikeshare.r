# Upload and name csv files
ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

#Install ggplot2
library(ggplot2)

#Head Function
head(ny)
head(wash)

# Replace blanks with 'NA' in NY and Chicago
ny_1 = read.csv('new_york_city.csv', na.strings=c("", "NA"))
chi_1 = read.csv('chicago.csv', na.strings=c("", "NA"))

# Find the mean of trip duration in Chicago
mean(chi[["Trip.Duration"]], na.rm=TRUE)

# Create bar graph of the most common bike share start station in Wasington, D.C.
ggplot(data=wash, aes(x=Start.Station)) +
  geom_bar(width=1) +
  scale_y_continuous(breaks = seq(0, 2000, 250)) +
  ggtitle('Most Common Bike Share Start Station in Washington, D.C.') +
  xlab('Start Station') +
  ylab('Number of Times Each Station was Starting Point')

# Summary statistics for D.C.
summary(wash)

# Create bar graph of the most common bike share start station in NY
ggplot(data=ny, aes(x=Start.Station)) +
  geom_bar(width=1) +
  scale_y_continuous(breaks = seq(0, 600, 75)) +
  ggtitle('Most Common Bike Share Start Station in New York City') +
  xlab('Start Station') +
  ylab('Number of Times Each Station was Starting Point')

# Summary statistics for NY
summary(ny)

# Create bar graph of the most common bike share start station in Chicago
ggplot(data=chi, aes(x=Start.Station)) +
  geom_bar(width=1) +
  scale_y_continuous(breaks = seq(0, 250, 50)) +
  ggtitle('Most Common Bike Share Start Station in Chicago') +
  xlab('Start Station') +
  ylab('Number of Times Each Station was Starting Point')

# Summary statistics for Chicago
summary(chi)

# Create boxplot of bike share travel time in males vs. females in Chicago
qplot(y = Trip.Duration, x = Gender,
      data = subset(chi_1, !is.na(Gender)),
      geom = 'boxplot') +
  coord_cartesian(ylim = c(0, 1000)) +
  ggtitle('Chicago Bike Share Travel Time; Males Vs. Females') +
  xlab('Gender') +
  ylab('Travel Time')

# Summary statistics for Chicago
by(chi$Trip.Duration, chi$Gender, summary)

# Create boxplot of bike share travel time in males vs. females in NY
qplot(y = Trip.Duration, x = Gender,
      data = subset(ny_1, !is.na(Gender)),
      geom = 'boxplot') +
  coord_cartesian(ylim = c(0, 1100)) +
  ggtitle('New York Bike Share Travel Time; Males Vs. Females') +
  xlab('Gender') +
  ylab('Travel Time')

# Summary statistics for NY
by(ny_1$Trip.Duration, ny_1$Gender, summary)

# Create scatter plot with line showing trip duration by age in NY
ggplot(aes(x = Birth.Year, y = Trip.Duration), data = ny) +
  geom_jitter(alpha = 1/5, color = 'blue') + 
  coord_cartesian(xlim = c(1940, 2000), ylim = c(60, 10800)) + 
  scale_x_continuous(breaks = seq(1940, 2000, 10)) +
  scale_y_continuous(breaks = seq(60, 10800, 1800)) +
  geom_line(stat = 'summary', fun.y = mean) +
  ggtitle('Trip Duration by Age in New York City') +
  xlab('Birth Year') +
  ylab('Trip Duration (Seconds)')

# Find the mean of trip duration in NY
mean(ny[["Trip.Duration"]], na.rm=TRUE)

# Create scatter plot with line showing trip duration by age in Chicago
ggplot(aes(x = Birth.Year, y = Trip.Duration), data = chi) +
  geom_jitter(alpha = 1/5, color = 'blue') + 
  coord_cartesian(xlim = c(1940, 2000), ylim = c(60, 10800)) + 
  scale_x_continuous(breaks = seq(1940, 2000, 10)) +
  geom_line(stat = 'summary', fun.y = mean) +
  ggtitle('Trip Duration by Age in Chicago') +
  xlab('Birth Year') +
  ylab('Trip Duration (Seconds)')

# Find the mean of trip duration in NY
mean(chi[["Trip.Duration"]], na.rm=TRUE)

system('python -m nbconvert Explore_bikeshare_data.ipynb')
