setwd('/home/tapas/Downloads/Mckinsey/')
tr <- read.csv('train.csv')
te <- read.csv('test.csv')
sub <-  read.csv('sample_submission.csv')
tr$Junction <- as.factor(tr$Junction)
str(tr)
tr$Vehicles <- as.factor(tr$Vehicles)
str(tr)
tr$Vehicles <- as.numeric(tr$Vehicles)
str(tr)
tr$Vehicles <- as.integer(tr$Vehicles)
str(tr)
tr$Junction <- as.numeric(tr$Junction)
tr$Vehicles_per_junction <- prod(tr$Junction,tr$Vehicles)
tr$Vehicles_per_junction <- NULL
tr$Vehicles_per_junction <- (tr$Junction * tr$Vehicles)
tr$Vehicles_per_junction <- (tr$Junction / tr$Vehicles)
tr$Vehicles_junction <- (tr$Junction * tr$Vehicles)
tr$Junction <- as.factor(tr$Junction)
tr$veh_jun <- ave(tr$Vehicles, tr$Junction)
library(lubridate)
tr$Date<- as.Date(tr$DateTime)
tr$DateTime<- NULL
tr$year<- year(tr$Date)
tr$month<- month(tr$Date)
tr$day <- day(tr$Date)
tr$year<- as.factor(tr$year)
tr$month<- as.factor(tr$month)
tr$day<- as.factor(tr$day)
tr$veh_jun_year <- ave(tr$Vehicles, tr$year)
tr$veh_jun_month <- ave(tr$Vehicles, tr$month)
tr$veh_jun_day <- ave(tr$Vehicles, tr$day)
tr$dec_date <- decimal_date(tr$Date)
#sub
write.csv(tr,file='predict.csv',row.names = FALSE)
tr <- read.csv('train.csv')
#tr$time <- format(as.POSIXct(strptime(tr$DateTime,"%Y-%m-%d %H:%M:%S",tz="")) ,format = "%H:%M:%S")
tr$time <- format(as.POSIXct(strptime(tr$DateTime,"%Y-%m-%d %H:%M:%S",tz="")) ,format = "%H")
str(tr)
tr$time <- as.factor(tr$time)
str(tr)
tr$veh__time <- ave(tr$Vehicles, tr$time)
tr$veh_jun<- tr$Junction * tr$Vehicles
tr$veh__jun_time <- ave(tr$veh__time, tr$time)
tr$veh__jun_time<- NULL
tr$time_jun<- tr$veh_jun / tr$veh__time
tr$veh__jun_time <- ave(tr$time_jun, tr$time)
write.csv(tr,file='predict_1.csv',row.names = FALSE)

df$Vehicles_1 <- df$Vehicles
df$Vehicles<- NULL
df$Vehicles <- df$Vehicles_1
df$Vehicles_1<- NULL
