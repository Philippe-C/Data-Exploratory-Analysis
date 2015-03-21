# Data-Exploratory-Analysis
Hello,

This is the second assignment corresponding to the Exploratory Data Analysis course from Coursera!

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site (http://www.epa.gov/ttn/chief/eiinformation.html).

The purpose of this assignment is to explore the National Emissions Inventory database. For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that we use for this assignment are for 1999, 2002, 2005, and 2008.

## Data [29MB]:

The data for this assignment are available (https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip) as a single zip file containing two files: 

summarySCC_PM25.rds

Source_Classification_Code.rds

## R code:

The "Plot1.R", "Plot2.R",... and "Plot6.R"  files (after downloading and unzipping) use these data to build the 6 requested plots ("Plot1.png", "Plot2.png",... and "Plot6.png"). The necessary packages are included in the respective codes.

These plots have been created to answer the 6 following questions:

Q1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? (Using the base plotting system).

Q2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? (Use the base plotting system).

Q3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? (Use the ggplot2 plotting system).

Q4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

Q5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

Q6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

## Answers:

### Plot 1
![plot1](https://cloud.githubusercontent.com/assets/10817013/6765700/b4d775de-cfeb-11e4-9645-5fa610940b3a.png)
A1. Yes,  sharp declined from 1999 to 2002. Then a slower decline between 2002 and 2005. Finally, another sharp declined from 2005 to 2008.

### Plot 2
![plot2](https://cloud.githubusercontent.com/assets/10817013/6765905/c2ebfaf8-cff2-11e4-8f47-7ef0ce2c3b1c.png)
A2. Yes, The data indicate a decline between 1999 and 2008 but it was not linear !! 

### Plot 3
![plot3] (https://cloud.githubusercontent.com/assets/10817013/6765733/d206f71e-cfec-11e4-979c-c53fe58250d3.png)
A3. We observe a decrease for type= NON-ROAD, NONPOINT, ON-ROAD ! from 1999 to 2008
    We observe an increase for type= POINT ! from 1999 to 2005

### Plot 4
![plot4] (https://cloud.githubusercontent.com/assets/10817013/6765929/b8b8b99e-cff3-11e4-88ce-6d2d41fd9cfa.png)
A4. Total (Purple Line): From the plot, we see that the purple line for total slightly declines from 1999 to 2002. From 2002 to 2005 the line has a marginal increase. Finally, from 2005 to 2008, the overall trend has a sharp decrease.
Point (Blue Line): From the plot, we see that the blue line for point is slightly similar in shape to the total purple line. From 1999 to 2002 the point blue line has a steeper decrease. From 2002 to 2005, the point blue line increases only slightly. Finally, from 2005 to 2008, the overall trend has a sharp decrease.
Nonpoint (Red Line): This line is remarkably different from the other two lines. From 1999 to 2002 it has an increase (although it starts from a much lower level than the other two lines at just above zero). From 2002 to 2005 it remains nearly level and does not appear to increase or decrease much. Finally, from 2005 to 2008, another symmetrical decrease occurs to end just below the initial levels for the 1999 values.

### Plot 5
![plot5] (https://cloud.githubusercontent.com/assets/10817013/6766178/eb678f7a-cffb-11e4-862a-43641268756e.png)
A5. Starting with 1999, the \(PM_{2.5}\) emissions was just below 350, the levels fell sharply until 2002. From 2002 to 2005 the levels plateaued. Finally from 2005 to 2008, the \(PM_{2.5}\) emissions drop to below 100 \(PM_{2.5}\) emissions.

### Plot 6
![plot6] (https://cloud.githubusercontent.com/assets/10817013/6766272/fc4b2802-cfff-11e4-8f4c-f0227d0f6b4a.png)
A6. Comparisons of \(PM_{2.5}\) emissions between Baltimore, MD (a city in MD) and Los Angeles, CA (county). In this case, we are asked to compare a city to a county. In plot 6, we notice that Baltimore, MD starts considerably lower in terms of \(PM_{2.5}\) emissions.

Baltimore, MD [city] (Red Line): The red line starts marginally above zero and below 1,000 \(PM_{2.5}\) emission values. Between 1999 and 2002, it slowly declines and remains nearly static between 2002 and 2008.

Los Angeles, CA [county] (Blue Line): The blue line starts significantly higher than the Baltimore, MD line. Starting with 1999, slightly below 4,000 \(PM_{2.5}\) emisions and steadily increases to 2005. The value of \(PM_{2.5}\) emissions for 2005 hits a peak at approximately 4,500 \(PM_{2.5}\) emision levels and then decreases between 2005 and 2008 with an ending value point of slightly above 4,000 \(PM_{2.5}\) emissions.


Have fun!

Philippe-C
