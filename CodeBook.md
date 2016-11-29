# CodeBook - EDA Peer-graded Assignment: Course Project 2 #

## Introduction ##
EPA observations and variables are required to  answer six questions in the Exploratory Data Analysis final project.  Here are the [Instructions](https://github.com/KonecnyA/Ex_Data_Plotting2/blob/master/Instructions.md "EDA Project 2 Instructions").  This markdown file is intended to  document source data, any transformations on the data and final data sets used by plot1.R to plot6.R. For documentation on my plot scripts use this link [README](https://github.com/KonecnyA/Ex_Data_Plotting2/blob/master/README.md "EDA Project 2 README") .

## Source Information, Data, License & Citation ##
### Data ###
The data for this assignment are available from the course web site as a single zip file:

- [Data for Peer Assessment](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip "Data for Peer Assessment") [29Mb]

The zip file contains two files:

PM2.5 Emissions Data (**summarySCC\_PM25.rds**): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

![Image1](https://github.com/KonecnyA/Ex_Data_Plotting2/blob/master/EDA Project 2 1.jpg)

- **fips**: A five-digit number (represented as a string) indicating the U.S. county
- **SCC**: The name of the source as indicated by a digit string (see source code classification table)
- **Pollutant**: A string indicating the pollutant
- **Emissions**: Amount of PM2.5 emitted, in tons
- **type**: The type of source (point, non-point, on-road, or non-road)
- **year**: The year of emissions recorded

Source Classification Code Table (**Source\_Classification\_Code.rds**): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

The code structure for the 8-digit point-source codes is:
      A BB CCC DD
Level 1  2   3  4

      1 01 001 01
Ext Comb /
Electric Gen /
Anthracite Coal /
Pulverized Coal

You can read each of the two files using the **readRDS()** function in R. For example, reading in each file can be done with the following code:

![Image2](https://github.com/KonecnyA/Ex_Data_Plotting2/blob/master/EDA Project 2 2.jpg)

as long as each of those files is in your current working directory (check by calling **dir()** and see if those files are in the listing).


[Reference](http://www.state.nj.us/dep/aqm/es/scc.pdf "Organizations of SCCs")
## Elements of a good CodeBook ##
- Study description
	- Who?
	- Why?
	- How?
- Sample information
	- What population studied?
	- How sample drawn?
	- What was the response rate?
- Technical file information
	- Number of observations
	- Record length
	- Number of records per observation
- Structure of the data within the file
- Details about the data
	- Columns in which specific variables can be found
	- Character or numeric?
	- If numeric, what format?
	- Summaries calculated?
	- Transformations or work performed?
- Text of questions and responses

[Reference](http://dss.princeton.edu/online_help/analysis/codebook.htm)

"The CodeBook is about the data, the README is about the code and the .R file scripts my learning adventure."

© Andrew Konecny 2016 All Rights reserved.