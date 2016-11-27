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
## Environmental Protection Agency (EPA) National Emissions Inventory (NEI)
NEI <- readRDS("data/summarySCC_PM25.rds") ## 6497651 obs. of 6 variables

## Source Code Classifications
##SCC <- readRDS("data/Source_Classification_Code.rds") ## 11717 obs. of 15 variables

## Subset data for Baltimore City, Maryland observations only.
## Just require variables: Emissions and year.
Baltimore.NEI <- subset(NEI, fips == "24510", c("Emissions", "year"))

## Total emissions from all sources by year for subset data.
Baltimore.NEI.PM25.year <- tapply(Baltimore.NEI$Emissions, Baltimore.NEI$year, sum)

## Data ready - Initialize png device - I found a number of problems went away vs. doing a dev.copy from screen.
png(file = "plot2.png", width = 480, height = 480)

## Plot emissions from all sources by year for subset data.
## Asked to use base plotting system.
## Build A Panel Plot - Histogram vs Line Graph
par(mfrow = c(1, 2), mar = c(4, 4, 2, 1), ps = 12, cex = 1, cex.main = 1) ## 1 row 2 columns

## Histogram
barplot(Baltimore.NEI.PM25.year,
        col = rainbow(20, start = 0, end = 1),
        xlab = "Year",
        ylab = expression("Total " ~ PM[2.5] ~ " Emissions (tons)"),
        main = expression("Total Baltimore City " ~ PM[2.5] ~ " by Year"))

## Line Graph
plot(names(Baltimore.NEI.PM25.year),
     Baltimore.NEI.PM25.year,
     type = "l",
     xlab = "Year",
     ylab = expression("Total " ~ PM[2.5] ~ " Emissions (tons)"),
     main = expression("Total Baltimore City " ~ PM[2.5] ~ " by Year"),
     lwd = 3,
     col = "steelblue")

## Finished so turn device off.
dev.off()

## Final housekeeping, clean up the memory.
rm(list=ls())