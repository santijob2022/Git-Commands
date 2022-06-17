# In this script we analyze the number of riders, using the stations
# located at a certain street.

library(ggplot2)
library(tidyverse)
library(readxl)
library(stringr)

excelFile = read.csv("bigDatasetCSV.csv", header = TRUE,  na.strings=c(""," ","NA"))
View(excelFile)

# Here we use regex to form a column with the beginning of the name street so 
# we can calssify better
excelFile <- excelFile %>% 
  mutate(street = str_extract(string = excelFile$start_station_id_complete,
                              pattern = "^\\S+")) %>% 
  mutate(Month = format(as.Date(excelFile$started_at),"%m")) %>% 
  drop_na(street) %>% 
  group_by(Month,member_casual,street) %>% 
  summarise(n=n()) 
#View(excelFile)

# we calculate the total by type of rider and by month
totals_by_Month <- excelFile %>% 
  group_by(Month,member_casual) %>% 
  summarise(sum_Month = sum(n))
#View(totals_by_Month)

# we add the percentage column
excelFile <- excelFile %>%
  group_by(Month, member_casual,street) %>% 
  mutate(percentage = case_when(
    member_casual == "casual" ~ as.numeric((n*100)/totals_by_Month[as.numeric(Month)*2-1,3]),
    member_casual == "member" ~ as.numeric((n*100)/totals_by_Month[as.numeric(Month)*2,3])
    )) 
#View(excelFile)

# Now we can visualize properly
  excelFile %>% 
  #select(Month, member_casual,street,percentage) %>% 
  filter(percentage >2.5) %>% 
  ggplot(aes(fill=member_casual, y = percentage , x = street)) + 
  geom_bar(position="dodge", stat="identity")+
  theme(axis.text.x = element_text(angle = 45))+
  ggtitle("Percentage of Riders using the stations belonging to the given street")+
  labs(subtitle = "Showing only percentage > 2.5", y = "Percentage by Month", x = "Streets",
       fill = "Type of Rider",caption = "12 Months of 2021")+
  scale_fill_brewer(palette = "Paired")+
  facet_wrap(~Month, ncol = 3)

##################################################################################################





