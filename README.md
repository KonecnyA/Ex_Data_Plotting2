# README - Exploratory Data Analysis Project 2 #

## Introduction ##
The focus of this text is to document my journey and iterative coding with the objective of answering six questions in the Exploratory Data Analysis final project.  Here are the [Instructions](https://github.com/KonecnyA/Ex_Data_Plotting2/blob/master/Instructions.md "EDA Project 2 Instructions"). For documentation on the load and transformed data please reference my [CodeBook](https://github.com/KonecnyA/Ex_Data_Plotting2/blob/master/CodeBook.md "EDA Project 2 CodeBook") .

## Background ##
- My Setup:
	- Windows 8.1 Enterprise Operating System
	- R Version 3.3.2
	- RStudio Version 1.0.44

## Common to plot1.R to plot6.R ##

## load_power.R##


## plot1.R ##
**Q1** Have total emissions from PM2.5 decreased in the United 
States from 1999 to 2008?

![plot1.png](https://github.com/KonecnyA/Ex_Data_Plotting2/blob/master/plot1.png)

**A1** There is a sharp decline in total PM2.5 emissions from 1999 to 2002.  From 2002 to 2005 a moderate decline.  Finally, from 2005 to 2008 there is another sharp decline.

I set the working directory and then load the NEI data per assignment instructions.  I comment out loading SCC data as not required at this time.  Next I sum emissions to have a list of total emissions by year.  With the data ready, I initialize the png device for final output to plot1.png.  After iteratively plotting and improving, I decided to have a Histogram vs Line Graph in the same graphic.  I use the base plotting system to do this. Notably I set a panel of 1 row 2 columns and improve many of the labels and titles. Once the plots are done I turn off the device.  Finally I do housekeeping and clean up the memory in the Environment.

## plot2.R ##
**Q2** Have total emissions from PM2.5 decreased in the  Baltimore City, Maryland ( fips == 24510) from 1999 to 2008?

![plot2.png](https://github.com/KonecnyA/Ex_Data_Plotting2/blob/master/plot2.png)

**A2** In Baltimore City, Maryland there is a sharp decrease from 1999 to 2002.  From 2002 to 2005 there is a sharp increase but not to the 1999 level.  Finally, from 2005 to 2008 there is a sharp decrease, again, in total PM2.5 emissions.

I set the working directory and then load the NEI data per assignment instructions.  I comment out loading SCC data as not required at this time.  I then subset the data to only have observations for Baltimore City, Maryland (fips == 24510) and the two variables required: Emissions and year.  Next I sum emissions to have a list of total emissions by year.  With the data ready, I initialize the png device for final output to plot2.png.  After iteratively plotting and improving, I decided to have a Histogram vs Line Graph in the same graphic.  I use the base plotting system to do this. Notably I set a panel of 1 row 2 columns and improve many of the labels and titles. Once the plots are done I turn off the device.  Finally I do housekeeping and clean up the memory in the Environment.

## plot3.R ##

**Q3** Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008?

![plot3.png](https://github.com/KonecnyA/Ex_Data_Plotting2/blob/master/plot3.png)

**A3** In Baltimore City, Maryland, type sources: nonroad, nonpoint and onroad total PM2.5 emissions, decrease from 1999 to 2008. The type source: point total PM2.5 emissions, increase from 1999 to 2005 and then decrease from 2005 to 2008.

I set the working directory and then load the NEI data per assignment instructions.  I comment out loading SCC data as not required at this time.  I then subset the data to only have observations for Baltimore City, Maryland (fips == 24510) and the three variables required: Emissions, type and year.  Next I sum emissions to have a data frame of total emissions by year and type.  With the data ready, I initialize the png device for final output to plot3.png.  After iteratively plotting and improving, I decided to have a Histogram vs Line Graph in the same graphic.  I use the base plotting system to do this. Notably I set a panel of 1 row 2 columns and improve many of the labels and titles. Once the plots are done I turn off the device.  Finally I do housekeeping and clean up the memory in the Environment.

## plot4.R ##

**Q4** Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

![plot4.png](https://github.com/KonecnyA/Ex_Data_Plotting2/blob/master/plot4.png)

**A4**

## plot5.R ##

**Q5** How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

![plot5.png](https://github.com/KonecnyA/Ex_Data_Plotting2/blob/master/plot5.png)

**A5**

## plot6.R ##

**Q6** Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == 06037). Which city has seen greater changes over time in motor vehicle emissions?

![plot6.png](https://github.com/KonecnyA/Ex_Data_Plotting2/blob/master/plot6.png)

**A6**

## Closing Thoughts ##
- None at this time

## Elements of a good README ##
- Requirements
	- What  is being asked?
- Introduction
	- Given the requirements, What going to achieve at a high level?
	- hyperlink to CodeBook
- Background
	- Readings/Preparation prior to starting
	- System Setup
- .R Script
	- How do scripts work?
	- How do scripts connect?
- Closing Thoughts

*"The CodeBook is about the data, the README is about the code and the .R file scripts my learning adventure."*

© Andrew Konecny 2016 All Rights reserved.