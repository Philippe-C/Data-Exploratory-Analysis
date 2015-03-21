##### Fourth QUESTION of the Project:
##### Across the United States, how have emissions from coal combustion-related sources 
##### changed from 1999–2008?

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
# We utilize the plyr package in order to split-apply-combine to simplify the dataset
library(ggplot2)
library(plyr)


## We utilize only the Coal Combustion sources as found via the patter of Comb and Coal in the short name
## We Collect the SCC numbers for the coal combustion sources
coalcom <- sccData[grep("Comb.*Coal", sccData$Short.Name), "SCC"]
 
## We Create a new dataframe including just the coalcombustion sources
coalcombNEI <- neiData[neiData$SCC %in% coalcom, ]

## We summarize the emissions by year to simplify the plot
total <- ddply(coalcombNEI, .(year), 
               summarise, 
               TotalEmissions = sum(Emissions))

png("Plot4.png", width=640)
g<- ggplot(total, aes(year, TotalEmissions)) 
g<- g+ geom_line() + geom_point() + labs(title = "Total Emissions from Coal Combustion-Related Sources Across the US", x = "Years", y = "Total Emissions (tons)")
print(g)

# ANSWER: Decreasing from 1999 to 2008 !

# We do not forget to close the graphic device.
dev.off()
