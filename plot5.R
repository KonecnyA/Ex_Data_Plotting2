## Exploratory Data Analysis
## Week 4 - Project 2

## Question 5 (plot5.R plot5.png)
##  How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

## Set working directory.
work_dir <- "C:/Users/konecnya/A Master File/Training/Coursera/4. Exploratory Data Analysis/Week 4/"
setwd(work_dir)

## Load data per assignment instructions.
NEI <- readRDS("data/summarySCC_PM25.rds")
# Only require these variables to answer the question.
NEI <- NEI[c("fips", "type", "Emissions", "year")]

## Subset data for Baltimore City, Maryland observations only and "motor vehicle sources".
## Just require variables: Emissions and year.
## I reviewed Data.Category, Short.Name, EI.Sector and SCC levels 1 to 4  on the SSC file.
## I felt Data.Category == "Onroad" which is type == "ON-ROAD" on NEI was the best proxy for "motor vehicle sources".
Baltimore.NEI  <- subset(NEI, fips == "24510" & type == "ON-ROAD", c("Emissions", "year"))

## Source Code Classifications - 11717 obs of 15 variables
##SCC <- readRDS("data/Source_Classification_Code.rds")

## SUM by year and Total Emissions.
Baltimore.total.PM25.year <- aggregate(Emissions ~ year, data = Baltimore.NEI, sum)

## Data ready - Initialize png device.
png(file = "plot5.png", width = 480, height = 480)

## Plot emissions from motor vehicle sources by year for Baltimore City, Maryland.
library(ggplot2)

qplot(year,
      Emissions,
      data = Baltimore.total.PM25.year) +
  
geom_line(colour = "steelblue",
          linetype = 1,
          size = 1.5) +

ggtitle(expression("Total Baltimore City " ~ PM[2.5] ~ " by Year for Motor Vehicle Sources")) +
  
xlab("Year") +
  
ylab(expression("Total " ~ PM[2.5] ~ " Emissions (tons)"))

## Finished so turn device off.
dev.off()

## Final housekeeping, clean up the memory.
rm(list=ls())