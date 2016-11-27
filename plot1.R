## Exploratory Data Analysis
## Week 4 - Project 2
## Have placed Instructions.md, README.md, CodeBook.md, R scripts and PNG files here: https://github.com/KonecnyA/Ex_Data_Plotting2

## Question 1 (plot1.R plot1.png)
##  Have total emissions from PM2.5 decreased in the United States from
##  1999 to 2008? Using the base plotting system, make a plot showing the
##  total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

## Set working directory.
work_dir <- "C:/Users/konecnya/A Master File/Training/Coursera/4. Exploratory Data Analysis/Week 4/"
setwd(work_dir)

## Load data per assignment instructions.
## Environmental Protection Agency (EPA) National Emissions Inventory (NEI)
NEI <- readRDS("data/summarySCC_PM25.rds") ## 6497651 obs. of 6 variables

## Source Code Classifications
##SCC <- readRDS("data/Source_Classification_Code.rds") ## 11717 obs. of 15 variables

## Total Emissions from all sources by year.
NEI.PM25.year <- tapply(NEI$Emissions, NEI$year, sum)

## Data ready - Initialize png device.
png(file = "plot1.png", width = 480, height = 480)

## Plot emissions from all sources by year.
## Asked to use base plotting system.
## Build A Panel Plot - Histogram vs Line Graph
par(mfrow = c(1, 2), mar = c(4, 4, 2, 1)) ## 1 row 2 columns

## Histogram
barplot(NEI.PM25.year,
        col = rainbow(20, start = 0, end = 1),
        xlab = "Year",
        ylab = expression("Total " ~ PM[2.5] ~ " Emissions (tons)"),
        main = expression("Total US " ~ PM[2.5] ~ " by Year")       
        )

## Line Graph
plot(names(NEI.PM25.year),
     NEI.PM25.year,
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