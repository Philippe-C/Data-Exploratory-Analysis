##### Third QUESTION of the Project:
##### Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##### Which of these four sources have seen decreases in emissions from 1999 to 2008 for Baltimore City? 
##### Which have seen increases in emissions from 1999 to 2008? 


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
# The graph is saved in the working directory.
library(ggplot2)

# Remember that 24510 represents Baltimore
subsetNEI  <- neiData[neiData$fips=="24510", ]

aggregatedTotalByYearAndType <- aggregate(Emissions ~ year + type, subsetNEI, sum)

png("Plot3.png", width=640, height=480)
g <- ggplot(aggregatedTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
        xlab("Years") +
        ylab(expression('Total PM'[2.5]*" Emissions (tons)")) +
        ggtitle('Total Emissions by type in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)

# ANSWER: Decreasing for type= NON-ROAD, NONPOINT, ON-ROAD ! from 1999 to 2008
#         Increasing for type= POINT ! from 1999 to 2005

# We do not forget to close the graphic device.
dev.off()
