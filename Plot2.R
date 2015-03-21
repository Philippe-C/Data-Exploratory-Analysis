##### Second QUESTION of the Project:
##### Have total emissions from PM2.5 decreased in Baltimore from 1999 to 2008? 

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

## STEP 2: 
# We Use the base plotting system to make a plot answering the question.
# The graph is saved in the working directory.

# Selection of the data for the city of Baltimore (24510).
subsetNEI  <- neiData[neiData$fips=="24510", ]

aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)
png('Plot2.png')
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="Years", ylab=expression('Total PM'[2.5]*' emissions (tons)'),main=expression('Total PM'[2.5]*' emissions in Baltimore from 1999 to 2008'))
# ANSWER: YES, total emssions have decreased (but not linearly) !


# We do not forget to close the graphic device.
dev.off()
