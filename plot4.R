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
##             SCC: Factor 8 digits - Need to merge, primary key
##       EI.Sector: - Need to search for "combustion" and "coal"
SCC <- readRDS("data/Source_Classification_Code.rds")

## Only require these variables to merge "EI.Sector" onto NEI data.
SCC <- SCC[c("SCC","EI.Sector")]

## Get EI.Sector onto the NEI data.
NEI.plus.EI.Sector <- merge (NEI, SCC, by = "SCC")

## Subset data for coal combustion-related sources only.
## Within variable EI.Sector - "Comb" and "Coal".
Coal.Combustion.Related <- NEI.plus.EI.Sector[grepl("[Cc]omb", NEI.plus.EI.Sector$EI.Sector) &
                                              grepl("[Cc]oal", NEI.plus.EI.Sector$EI.Sector), ]

## SUM by year, EI.Sector ("Combustion" and "Coal") and Total Emissions.
total.PM25.year <- aggregate(Emissions ~ year + EI.Sector, data = Coal.Combustion.Related, sum)

## Data ready - Initialize png device.
png(file = "plot4.png", width = 480, height = 480)

## Plot emissions from "Combustion" and "Coal" sources by year for US.
library(ggplot2)

## Decided to log10 Total Emissions to better display the relative changes over time.
qplot(year,
      log10(Emissions),
      data = total.PM25.year) +
  
geom_line(aes(colour = EI.Sector),
          linetype = 1,
          size = 1.5) +
  
ggtitle(expression("Log10(Total) US " ~ PM[2.5] ~ " by Year & Combustion + Coal")) +
  
theme(plot.title = element_text(size = 11, face = "bold")) + 
  
xlab("Year") +
  
ylab(expression("Log10(Total) " ~ PM[2.5] ~ " Emissions (tons)")) +
  
labs(colour = "Coal Combustion") +

scale_color_manual(values = c("red", "green", "blue"),
                   
                   labels = c("Commercial Institutional",
                              "Electric Generation",
                              "Industrial Boilers ICEs"))

## Finished so turn device off.
dev.off()

## Final housekeeping, clean up the memory.
rm(list=ls())