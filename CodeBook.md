# CodeBook - Exploratory Data Analysis Project 1 #

## Introduction ##
This markdown file is intended to  document source data, any transformations on the data and final data sets used by plot1.R, plot2.R, plot3.R and plot4.R. For documentation on my plot scripts use this link [README](https://github.com/KonecnyA/ExData_Plotting1/blob/master/README.md) .

## Source Information, Data, License & Citation ##

- Source of data [UC Irvine Machine Learning Repository](http://archive.ics.uci.edu/ml/)
  
- Data set [Electric power consumption](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip), 20Mb

- **Study Description** - Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
- [Citation Policy](http://archive.ics.uci.edu/ml/citation_policy.html):
If you publish material based on databases obtained from this repository, then, in your acknowledgements, please note the assistance you received by using this repository. This will help others to obtain the same data sets and replicate your experiments. We suggest the following pseudo-APA reference format for referring to this repository: Lichman, M. (2013). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science.

## household\_power\_consumption.zip ##
The following descriptions of the 9 variables in the dataset are taken from the [UCI web site](https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption):

1.Date: Date in format dd/mm/yyyy

2.Time: time in format hh:mm:ss

3.Global\_active_power: household global minute-averaged active power (in kilowatt)

4.Global\_reactive_power: household global minute-averaged reactive power (in kilowatt)

5.Voltage: minute-averaged voltage (in volt)

6.Global\_intensity: household global minute-averaged current intensity (in ampere)

7.Sub\_metering\_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).

8.Sub\_metering\_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.

9.Sub\_metering\_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
 


## Loading the data ##
When loading the dataset into R, please consider the following:

- The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).
- We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
- You may find it useful to convert the Date and Time variables to Date/Time classes in R using the "strptime()"  and "as.Date()" functions.
- Note that in this dataset missing values are coded as ?.

## load_power.R##
I decided to program this script to prepare the data for the four plots. I download the "household\_power\_consumption.zip" file as identified above. It indicates that the file is 19.7 MB. It is then unzipped into a data directory as "household\_power\_consumption.txt" .

I set the classes appropriately for the 9 variables.  The first two "Date" and "Time" are set to "character".  "Global\_active\_power", "Global\_reactive\_power", "Voltage", "Global\_intensity", "Sub\_metering\_1", "Sub\_metering_2" & "Sub\_metering\_3" are set to "numeric"

When the data frame "df\_household\_power\_consumption" is created, there are 2,075,259 rows (observations) and 9 columns (variables). This matches the information provided with the data set.

The next transformation to the data set is to only select data for the first two days in February for the year 2007. This results in 2,880 rows of 9 columns.

The last transformation to the data prior to plotting is to convert the Date and Time. I learned using "strptime()" that it returns a POSIXlt variable which holds both date and time. I decided to use and leverage this for plotting overwriting what was in the original Time variable. I did try setting Date and Time separately and just commented them out.

At this point in time there is a data frame ready to do the four plots that have been requested.

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