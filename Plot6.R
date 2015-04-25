library(ggplot2)

## Read data in ##
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## extract data related to motor vehicles ##
vehicles<- grepl("vehicle",SCC$SCC.Level.Two,ignore.case=TRUE)
SCC_subset<-SCC[vehicles,]
NEI_subset<-NEI[NEI$SCC %in% SCC_subset$SCC,]

## extract baltimore data and la data from motor vehicle subset ##
## add a city description column for use with plotting
baltimore<-NEI_subset[NEI_subset$fips == "24510",]
baltimore$city<-"Baltimore"
la<-NEI_subset[NEI_subset$fips == "06037",]
la$city<-"Los Angeles"

## combine the baltimore and la data sets using rbind() ##
combined<- rbind(baltimore,la)

## create plot ##
png("plot6.png",width=480,height=480)

plot <- ggplot(combined,aes(factor(year),Emissions)) +
  geom_bar(aes(fill=year),stat="identity") + theme_bw() +
  facet_grid(.~city,scales = "free",space="free") + 
  labs(x="Year", y="Total Motor Vehicle Emission (Tons)") + 
  labs(title="Motor Vehicle Emissions in Baltimore and Los Angeles")

print(plot)
dev.off()