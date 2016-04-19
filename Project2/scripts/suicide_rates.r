Indicators <- read.csv("~/Desktop/world-development-indicators/Indicators.csv")
View(Indicators)
suicide_rates <- read.csv("~/Desktop/suicide_rates.csv")
View(suicide_rates)
total <- merge(Indicators, suicide_rates,by.y="X", by.x = "CountryName")

Data_2012 <- subset(total, Year ==2012,select=c(CountryName, IndicatorName, Value, Year, Age.standardized.suicide.rates..per.100.000., Age.standardized.suicide.rates..per.100.000..1,Age.standardized.suicide.rates..per.100.000..2 ))

Cell_Data <- subset(Data_2012, IndicatorName =="Mobile cellular subscriptions (per 100 people)",select=c(CountryName, IndicatorName, Value, Year, Age.standardized.suicide.rates..per.100.000., Age.standardized.suicide.rates..per.100.000..1,Age.standardized.suicide.rates..per.100.000..2 ))
qplot(Cell_Data$Value, Cell_Data$Age.standardized.suicide.rates..per.100.000..1)

F_gov_Data <- subset(Data_2012, IndicatorName =="Proportion of seats held by women in national parliaments (%)",select=c(CountryName, IndicatorName, Value, Year, Age.standardized.suicide.rates..per.100.000., Age.standardized.suicide.rates..per.100.000..1,Age.standardized.suicide.rates..per.100.000..2 ))
qplot(F_gov_Data$Value, F_gov_Data$Age.standardized.suicide.rates..per.100.000..1, xlab = "Percentage of seats held by females in national parliament", ylab = "Male suicide rate")

