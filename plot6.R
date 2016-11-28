## Exploratory Data Analysis
## Week 4 - Project 2

## Question 6 (plot6.R plot6.png)
##  Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles
##  County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

## Set working directory.
work_dir <- "C:/Users/konecnya/A Master File/Training/Coursera/4. Exploratory Data Analysis/Week 4/"
setwd(work_dir)

## Load data per assignment instructions.
NEI <- readRDS("data/summarySCC_PM25.rds")

## Subset data for Baltimore City, Maryland (fips == "24510") and Los Angeles County (fips == "06037" )and "motor vehicle sources".
## I reviewed Data.Category, Short.Name, EI.Sector and SCC levels 1 to 4  on the SSC file.
## I felt Data.Category == "Onroad" which is type == "ON-ROAD" on NEI was the best proxy for "motor vehicle sources".
Baltimore.LosAngeles.NEI  <- subset(NEI, (fips == "24510" | fips == "06037") & type == "ON-ROAD", c("Emissions", "year", "fips"))

## Source Code Classifications - 11717 obs of 15 variables
##SCC <- readRDS("data/Source_Classification_Code.rds")

## SUM by year and Total Emissions.
Baltimore.LosAngeles.total.PM25.year <- aggregate(Emissions ~ year + fips, data = Baltimore.LosAngeles.NEI, sum)

## Data ready - Initialize png device.
png(file = "plot6.png", width = 480, height = 480)

## Plot emissions from motor vehicle sources by year for Baltimore City, Maryland.
library(ggplot2)

qplot(year,
      Emissions,
      data = Baltimore.LosAngeles.total.PM25.year) +
  
  geom_line(aes(colour = fips),
            linetype = 1,
            size = 1.5) +
  
ggtitle(expression("Los Angeles County vs Baltimore City " ~ PM[2.5] ~ " by Year for Motor Vehicle Sources")) +

theme(plot.title = element_text(size = 10, face = "bold")) +

xlab("Year") +
  
ylab(expression("Total " ~ PM[2.5] ~ " Emissions (tons)")) +

labs(colour = "Location") +

scale_color_manual(values = c("pink", "steelblue"),
                   labels = c("Los Angeles County",
                              "Baltimore City"))

## Finished so turn device off.
dev.off()

## Final housekeeping, clean up the memory.
rm(list=ls())