## Exploratory Data Analysis
## Week 4 - Project 2
## Have placed Instructions.md, README.md, CodeBook.md, R scripts and PNG files here: https://github.com/KonecnyA/Ex_Data_Plotting2

## Question 2 (plot2.R plot2.png)
##  Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
##  from 1999 to 2008? Use the base plotting system to make a plot answering this question.

## Set working directory.
work_dir <- "C:/Users/konecnya/A Master File/Training/Coursera/4. Exploratory Data Analysis/Week 4/"
setwd(work_dir)

## Load data per assignment instructions.
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

## Subset data for Baltimore City, Maryland observations only.
## Just require variables: Emissions and year.
Baltimore.City.Maryland <- subset(NEI, fips == "24510", c("Emissions", "year"))

## Initialize png device - I found a number of problems went away vs. doing a dev.copy from screen.
png(file = "plot2.png", width = 480, height = 480)

## Total emissions from all sources by year for subset data.
total.PM25.year <- tapply(Baltimore.City.Maryland$Emissions, Baltimore.City.Maryland$year, sum)

## Plot emissions from all sources by year for subset data.
## Build A Panel Plot - Histogram vs Line Graph
par(mfrow = c(1, 2), mar = c(4, 4, 2, 1)) ## 1 row 2 columns

## Histogram
barplot(total.PM25.year,
        col = rainbow(20, start = 0, end = 1),
        xlab = "Year",
        ylab = expression("Total " ~ PM[2.5] ~ " Emissions (tons)"),
        main = expression("Total Baltimore City, Maryland " ~ PM[2.5] ~ " by Year")       
)

## Line Graph
plot(names(total.PM25.year),
     total.PM25.year,
     type = "l",
     xlab = "Year",
     ylab = expression("Total " ~ PM[2.5] ~ " Emissions (tons)"),
     main = expression("Total Baltimore City, Maryland " ~ PM[2.5] ~ " by Year"),
     lwd = 3,
     col = "steelblue")

## Finished so turn device off.
dev.off()

## Final housekeeping, clean up the memory.
rm(list=ls())