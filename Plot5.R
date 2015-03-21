##### Fifth QUESTION of the Project:
##### How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

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
# We use the ggplot2 plotting system to make a plot answering the question.
library(ggplot2)
library(grid)
# The graph is saved in the working directory.

# We Summarise the totals for sources in Baltimore City (24510) and type="ON-ROAD" to capture motor vehicles
library(plyr)

## STEP 2A: We subset our data 
# We subset our data  with the following assumption: motor vehicles = On and
# check the levels for types of vehicles defined
mv.sourced <- unique(grep("Vehicles", sccData$EI.Sector, ignore.case = TRUE, value = TRUE))
mv.sourcec <- sccData[sccData$EI.Sector %in% mv.sourced, ]["SCC"]

## STEP 2B:
# We subset the emissions from motor vehicles from
# neiData for Baltimore=24510.
emMV.ba <- neiData[neiData$SCC %in% mv.sourcec$SCC & neiData$fips == "24510",]

## STEP3:
# Finding the emissions due to motor vehicles in Baltimore for every year
balmv.pm25yr <- ddply(emMV.ba, .(year), function(x) sum(x$Emissions))
colnames(balmv.pm25yr)[2] <- "Emissions"

## STEP 4:
# Plotting to a png file
png("Plot5.png")
g<- qplot(year, Emissions, data=balmv.pm25yr, geom="line") + ggtitle(expression("Baltimore City" ~ PM[2.5] ~ "Motor Vehicle Emissions by Year")) + xlab("Years") + ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)"))
print(g)

# ANSWER: Decreasing !

# We do not forget to close the graphic device.
dev.off()

