## Exploratory Data Analysis
## Week 4 - Project 2
## Have placed Instructions.md, README.md, CodeBook.md, R scripts and PNG files here: https://github.com/KonecnyA/Ex_Data_Plotting2

## Question 3 (plot3.R plot3.png)
##  Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
##  which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008?
##  Use the ggplot2 plotting system to make a plot answer this question.

## Set working directory.
work_dir <- "C:/Users/konecnya/A Master File/Training/Coursera/4. Exploratory Data Analysis/Week 4/"
setwd(work_dir)

## Load data per assignment instructions.
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

## Subset data for Baltimore City, Maryland observations only.
## Just require variables: Emissions, type and year.
Baltimore.City.Maryland <- subset(NEI, fips == "24510", c("Emissions", "type", "year"))

library("data.table")
setDT(Baltimore.City.Maryland)
Baltimore.City.Maryland <- Baltimore.City.Maryland[, .(Emissions = sum(Emissions)), by = .(type, year)]

## Initialize png device - I found a number of problems went away vs. doing a dev.copy from screen
png(file = "plot3.png", width = 480, height = 480)

## Plot emissions from all sources by year and type.
## Subset for just Baltimore.City.Maryland after data loaded.
## Asked to use ggplot2 plotting system.
library(ggplot2)
qplot(year,
      Emissions,
      data = Baltimore.City.Maryland) +
  
      geom_line(aes(colour = type),
                linetype = 1,
                size = 1.5) +
  
      ggtitle(expression("Total Baltimore City, Maryland " ~ PM[2.5] ~ " by Year & Type")) +
  
      xlab("Year") +
  
      ylab(expression("Total " ~ PM[2.5] ~ " Emissions (tons)")) +
      
      labs(colour = "Type")

## Finished so turn device off.
dev.off()

## Final housekeeping, clean up the memory.
rm(list=ls())