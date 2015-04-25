library(ggplot2)

## Read data in ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## extract data related to coal combustion emissions ##
combusted_coal<- grepl("comb",SCC$Short.Name,ignore.case=TRUE)&grepl("coal",SCC$Short.Name,ignore.case=TRUE)
SCC_subset<-SCC[combusted_coal,]
NEI_subset<-NEI[NEI$SCC %in% SCC_subset$SCC,]

## create plot ##
png("plot4.png",width=480,height=480)

plot <- ggplot(NEI_subset,aes(factor(year),Emissions/10^3)) +
  geom_bar(aes(fill=year), stat="identity") + theme_bw() +
  labs(x="Year", y="Total Coal Emission(Thousands of Tons)") + 
  labs(title="Total US Combusted Coal Emissions")

print(plot)
dev.off()