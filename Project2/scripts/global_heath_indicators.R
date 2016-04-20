death <- read.csv("/Users/rachelhankins/anaconda/Global Heath Indicators/death_rate.csv", header=TRUE)
country <- read.csv("/Users/rachelhankins/anaconda/Global Heath Indicators/Country.csv", header=TRUE)

death_stats <- merge(death, country, by.x= "CountryName", by.y="CountryName")

View(death_stats)

death_stats <- subset(death_stats, Year == 2000)

indicators <- read.csv("/Users/rachelhankins/anaconda/Global Heath Indicators/Indicators.csv", header=TRUE)
View(indicators)

indicators_stats <- subset(indicators, Year == 2000 & IndicatorName == 'Prevalence of undernourishment (% of population)')
View(indicators_stats)
indicator_stats_with_death <- merge(indicators_stats, death_stats, by.x= "CountryName", by.y="CountryName")


names(indicator_stats_with_death)[8] <- "DeathRateAllCauses"
View(indicator_stats_with_death)

library(ggplot2)
attach(indicator_stats_with_death)
nourish_death_model <- lm(Value ~ DeathRateAllCauses)
summary(nourish_death_model)
p <- qplot(Value, DeathRateAllCauses, col=IncomeGroup, main="Death Rate vs. Undernourishment", xlab="Prevalnce of Undernourishment (% of population)", ylab="Death Rate (All Causes)")
p + geom_abline(intercept = 3.041543, slope = 0.014357)

indicators_stats_pop <- subset(indicators, Year == 2000 & IndicatorName == 'Population, total' & Value < 40000000)
View(indicators_stats_pop)
indicator_stats_with_death_pop <- merge(indicators_stats_pop, death_stats, by.x= "CountryName", by.y="CountryName")
names(indicator_stats_with_death_pop)[8] <- "Population"



attach(indicator_stats_with_death_pop)
pop_death_model <- lm(Value ~ Population)
summary(pop_death_model)
p <- qplot(Value, Population, main="Death Rate vs. Population", col=IncomeGroup, xlab="Total Population", ylab="Death Rate (All Causes)")
p + geom_abline(intercept = 8217247.4 , slope = 363.3 )



write.csv(indicator_stats_with_death, "data2000.csv")