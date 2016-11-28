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
# Only require these variables to answer the question.
NEI <- NEI[c("SCC", "Emissions", "year")]


## Source Code Classifications - 11717 obs of 15 variables
##             SCC: Factor 8 digits
##      Short.Name: Factor
##       EI.Sector:
##   SCC.Level.One: Factor
##   SCC.Level.Two: Factor
## SCC.Level.Three: Factor
##  SCC.Level.Four: Factor
SCC <- readRDS("data/Source_Classification_Code.rds")
## Only require these variables to merge "EI.Sector" onto NEI data
SCC <- SCC[c("SCC","EI.Sector")]

## Get EI.Sector onto the NEI data.
NEI.plus.EI.Sector <- merge (NEI, SCC, by = "SCC")

## Subset data for coal combustion-related sources only.
## Within variable EI.Sector - "Comb" and "Coal"
Coal.Combustion.Related <- NEI.plus.EI.Sector[grep("[Cc]oal", NEI.plus.EI.Sector$EI.Sector), ]

## Initialize png device - I found a number of problems went away vs. doing a dev.copy from screen
png(file = "plot4.png", width = 480, height = 480)

## year, EI.Sector ("Combustion" and "Coal") and Total Emissions
total.PM25.year <- aggregate(Emissions ~ year + EI.Sector, data = Coal.Combustion.Related, sum)

## Plot emissions from "combustion" and "Coal" sources by year for US.
## Asked to use ggplot2 plotting system.
library(ggplot2)

## This is seperate Histograms for each type.
ggplot(total.PM25.year,aes(factor(year),Emissions,fill=EI.Sector)) +
geom_bar(stat="identity") +
facet_grid(. ~ EI.Sector) +
  
## Cleanup Titles & Labels.
ggtitle(expression("Total US " ~ PM[2.5] ~ " by Year & Combustion + Coal")) +
xlab("Year") +
ylab(expression("Total " ~ PM[2.5] ~ " Emissions (tons)")) +
labs(fill = "EI Sector")

## Finished so turn device off.
dev.off()

## Final housekeeping, clean up the memory.
rm(list=ls())