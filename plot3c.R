## Exploratory Data Analysis
## Week 4 - Project 2
## Have placed Instructions.md, README.md, CodeBook.md, R scripts and PNG files here: https://github.com/KonecnyA/Ex_Data_Plotting2

## Question 3 (plot3c.R plot3c.png)
##  Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
##  which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008?
##  Use the ggplot2 plotting system to make a plot answer this question.

## Set working directory.
work_dir <- "C:/Users/konecnya/A Master File/Training/Coursera/4. Exploratory Data Analysis/Week 4/"
setwd(work_dir)

## Load data per assignment instructions.
## Environmental Protection Agency (EPA) National Emissions Inventory (NEI)
NEI <- readRDS("data/summarySCC_PM25.rds") ## 6497651 obs. of 6 variables

## Source Code Classifications
SCC <- readRDS("data/Source_Classification_Code.rds") ## 11717 obs. of 15 variables

## Subset data for Baltimore City, Maryland observations only.
## Just require variables: Emissions, type and year.
Baltimore.NEI  <- subset(NEI, fips == "24510", c("Emissions", "type", "year"))

## year, type and Total Emissions
Baltimore.NEI.PM25 <- aggregate(Emissions ~ year + type, data = Baltimore.NEI, sum)

## Initialize png device - I found a number of problems went away vs. doing a dev.copy from screen
png(file = "plot3c.png", width = 480, height = 480)

## Plot emissions from all sources by year and type (for Baltimore City, Maryland).
## Asked to use ggplot2 plotting system.
library(ggplot2)

## Version 2 - This is seperate Line Graphs for each type (NON-ROAD, NONPOINT, ON-ROAD, POINT).
qplot(year,
      Emissions,
      data = Baltimore.NEI.PM25) +

geom_line(aes(colour = type),
          linetype = 1,
          size = 1.5) +

facet_grid(. ~ type) +
  
## Cleanup Titles & Labels.
ggtitle(expression("Total Baltimore City, Maryland " ~ PM[2.5] ~ " by Year & Type")) +
xlab("Year") +
ylab(expression("Total " ~ PM[2.5] ~ " Emissions (tons)")) +
labs(colour = "Type")

## Finished so turn device off.
dev.off()

## Final housekeeping, clean up the memory.
rm(list=ls())