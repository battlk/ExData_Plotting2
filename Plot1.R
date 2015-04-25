## Read data in ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## sum up total emissions by year ##
yearly_sums <- aggregate(Emissions ~ year,NEI, sum)

## create plot ##
png("plot1.png",width=480,height=480)

barplot((yearly_sums$Emissions)/10^6, xlab="Year", ylab="Emissions (Millions of Tons)",
        main="Total Emissions From All Sources", names.arg=yearly_sums$year)

dev.off()
