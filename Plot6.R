##### Sixth QUESTION of the Project:
##### Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
##### vehicle sources in Los Angeles County, California (fips == "06037"). 
##### Which city has seen greater changes over time in motor vehicle emissions?

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

# We Remember: 24510=Baltimore (MD) and 06037= Los Angeles California (CA)
# We are seaching for ON-ROAD type in neiData
subsetNEI <- neiData[(neiData$fips=="24510"|neiData$fips=="06037") & neiData$type=="ON-ROAD",  ]

# Aggregating the level of emissions by years for both cities
aggregatedTotalByYearAndFips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="24510"] <- "Baltimore, MD"
aggregatedTotalByYearAndFips$fips[aggregatedTotalByYearAndFips$fips=="06037"] <- "Los Angeles, CA"

## STEP 3:
# Plotting to png
png("Plot6.png", width=1040, height=600)
g <- ggplot(aggregatedTotalByYearAndFips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions")) +
        ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD  vs Los Angeles, CA (1999-2008)')
print(g)

# ANSWER: Better living in Baltimore !

# We do not forget to close the graphic device.
dev.off()


