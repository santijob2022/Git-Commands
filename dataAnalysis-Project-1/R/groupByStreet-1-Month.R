# In this script we analyze the number of riders, by type, using each station.

library(ggplot2)
library(tidyverse)
library(readxl)
library(stringr)

excelFile = read.csv("202101-divvy-tripdata.csv", header = TRUE,  na.strings=c(""," ","NA"))
View(excelFile)

# Here we use regex to form a column with the beginning of the name street so 
# we can calssify better
excelFile <- excelFile %>% 
  mutate(street = str_extract(string = excelFile$start_station_id_complete,
                              pattern = "^\\S+")) 

# we count the number of total riders by type using each street
excelFile <- excelFile %>% 
  drop_na(street) %>% 
  group_by(member_casual, street) %>% 
  summarise(n=n())

# we calculate the total by type of member and by street
totals_by_riderType <- excelFile %>% 
  group_by(member_casual) %>% 
  summarise(sum(n))

# we add the percentage column
excelFile <- excelFile %>%
  group_by(member_casual,street) %>% 
  mutate(percentage = case_when(
    member_casual == "casual" ~ as.numeric((n*100)/totals_by_riderType[1,2]),
    member_casual == "member" ~ as.numeric((n*100)/totals_by_riderType[2,2])
    ))
#View(excelFile)

# Now we can visualize properly
excelFile %>% 
  filter(percentage >=1) %>% 
  ggplot(aes(fill=member_casual, y = percentage , x = street)) + 
  geom_bar(position="dodge", stat="identity")+
  theme(axis.text.x = element_text(angle = 45))

