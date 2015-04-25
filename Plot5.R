library(ggplot2)

## Read data in ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## extract data related to motor vehicles ##
vehicles<- grepl("vehicle",SCC$SCC.Level.Two,ignore.case=TRUE)
SCC_subset<-SCC[vehicles,]
NEI_subset<-NEI[NEI$SCC %in% SCC_subset$SCC,]

## from the motor vehicle subset, extract baltimore data ##
baltimore<-NEI_subset[NEI_subset$fips == "24510",]

## create plot ##
png("plot5.png",width=480,height=480)

plot <- ggplot(baltimore,aes(factor(year),Emissions)) +
  geom_bar(aes(fill=year), stat="identity") + theme_bw() +
  labs(x="Year", y="Total Emission(Tons)") + 
  labs(title="Motor Vehicle Emissions in Baltimore")

print(plot)
dev.off()