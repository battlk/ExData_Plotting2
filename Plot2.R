## Read data in ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## extract baltimore data and sum up emisions by year ##
baltimore<-NEI[NEI$fips == "24510",]
baltimore_yearly_sums <- aggregate(Emissions ~ year,baltimore, sum)

## create plot ##
png("plot2.png",width=480,height=480)

barplot((baltimore_yearly_sums$Emissions), xlab="Year", ylab="Emissions (Tons)",
        main="Total Emissions From Baltimore", names.arg=baltimore_yearly_sums$year)

dev.off()