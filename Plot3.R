library(ggplot2)

## Read data in ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## extract baltimore data ##
baltimore<-NEI[NEI$fips == "24510",]

## create plot ##
png("plot3.png",width=480,height=480)

plot <- ggplot(baltimore,aes(factor(year),Emissions)) +
  geom_bar(aes(fill=year), stat="identity") + theme_bw() +
  facet_grid(.~type,scales = "free",space="free") + 
  labs(x="Year", y="Total Baltimore Emission (Tons)") + 
  labs(title="Baltimore Emissions By Source")

print(plot)
dev.off()