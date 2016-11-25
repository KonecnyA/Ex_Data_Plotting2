## Exploratory Data Analysis
## Week 4 - Project 2

## Question 4 (plot4.R plot4.png)
##  Across the United States,
##  how have emissions from coal combustion-related sources changed
##  from 1999-2008?

## Set working directory.
work_dir <- "C:/Users/konecnya/A Master File/Training/Coursera/4. Exploratory Data Analysis/Week 4/"
setwd(work_dir)

## Load data per assignment instructions.
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

## Subset data for coal combustion-related sources only.
## Just require variables: Emissions and year.
Coal.Combustion.Related <- subset(NEI, fips == "24510", c("Emissions", "year"))

## Initialize png device - I found a number of problems went away vs. doing a dev.copy from screen
png(file = "plot4.png", width = 480, height = 480)

## Total emissions from all sources by year.
total.PM25.year <- tapply(Coal.Combustion.Related$Emissions, Coal.Combustion.Related$year, sum)

## Plot emissions from all sources by year.
plot(names(total.PM25.year),
     total.PM25.year,
     type = "l",
     xlab = "Year",
     ylab = expression("Total " ~ PM[2.5] ~ " Emissions (tons)"),
     main = expression("Total US " ~ PM[2.5] ~ " by Year"),
     lwd = 3,
     col = "steelblue")

## Finished so turn device off.
dev.off()

## Final housekeeping, clean up the memory.
rm(list=ls())