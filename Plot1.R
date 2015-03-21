##### First QUESTION of the Project:
##### Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 

## STEP 1: Loading the data - It will take some time!
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", dest="~/Data-Exploratory-Analysis/Data", method="curl") 
unzip("~/Data-Exploratory-Analysis/Data", exdir = "~/Data-Exploratory-Analysis/Unzip")

# Check if dataset exist. If not, load the dataset.
if (!"neiData" %in% ls()) {
        neiData <- readRDS("~/Data-Exploratory-Analysis/Unzip/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
        sccData <- readRDS("~/Data-Exploratory-Analysis/Unzip/Source_Classification_Code.rds")
}

# STEP 2: 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.
# The graph is saved in the working directory.

aggregatedTotalByYear <- aggregate(Emissions ~ year, neiData, sum)
png('Plot1.png')
plot( aggregatedTotalByYear$year, aggregatedTotalByYear$Emissions, type="l", col="red", xlab="Years", ylab=expression('Total PM'[2.5]*' emission (tons)'),main=expression('Total PM'[2.5]*' emissions in the US from 1999 to 2008'))

# ANSWER: YES, total emssions have decreased !

# Alternatively we could have built the following graph:
# barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="Years", ylab=expression('Total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions in the US from 1999 to 2008'))

# We do not forget to close the graphic device
dev.off()
