# In this script we analyze the number of riders, by type, taking into account the
# plane distance traveled.

library(ggplot2)
library(tidyverse)
library(readxl)

excelFile = read.csv("bigDatasetCSV.csv", header = TRUE,  na.strings=c(""," ","NA"))
#View(excelFile)

# We add a Months column to group_by after
excelFile <- excelFile %>% 
  mutate(Month = format(as.Date(excelFile$started_at),"%m"))
#View(excelFile)

# we calculate the total by type of member
total_by_memberType <- excelFile %>% 
  drop_na(start_lat,end_lat) %>%
  group_by(Month,member_casual) %>% 
  summarise(total_rider_type = n()) 

# transformation for graph
proof2 <-
  excelFile %>%
  select(rideable_type,started_at,start_lat,start_lng,end_lat,end_lng,
         member_casual,ride_duration_hours,Month) %>% 
  drop_na(start_lat,end_lat) %>% 
  mutate(plane_distance = sqrt((start_lat-end_lat)^2+(start_lng-end_lng)^2)) %>% 
  select(rideable_type, started_at, member_casual, ride_duration_hours,plane_distance,Month) %>% 
  mutate( Intervals = case_when
         ( plane_distance == 0 & ride_duration_hours == 0 ~ -1,
           plane_distance == 0 & ride_duration_hours > 0 ~ 0,
           plane_distance > 0 & plane_distance <= 0.01 ~ 0.01,
           plane_distance > 0.01 & plane_distance <= 0.02 ~ 0.02,
           plane_distance > 0.02 & plane_distance <= 0.03 ~ 0.03,
           plane_distance > 0.03 & plane_distance <= 0.04 ~ 0.04,
           plane_distance > 0.04 & plane_distance <= 0.05 ~ 0.05,
           plane_distance > 0.05 & plane_distance <= 0.06 ~ 0.06,
           plane_distance > 0.06 & plane_distance <= 0.07 ~ 0.07,
           plane_distance > 0.07 & plane_distance <= 0.08 ~ 0.08,
           plane_distance > 0.08 & plane_distance <= 0.09 ~ 0.09,
           plane_distance > 0.09 & plane_distance <= 0.1 ~ 0.1,
           TRUE ~ -1
         )
        ) %>% 
  group_by(Month,Intervals, member_casual) %>% 
  summarise(total_by_interval = n()) %>%
  group_by(Month, Intervals,member_casual) %>% 
  mutate(percentage = case_when(
      member_casual == "casual" ~ 
        as.numeric((total_by_interval*100)/total_by_memberType[as.numeric(Month)*2-1,3]),
      member_casual == "member" ~ 
        as.numeric((total_by_interval*100)/total_by_memberType[as.numeric(Month)*2,3])
    )
    ) 

#View(proof2)

# Here we separate the graph from the dataFrame which we name "proof2"
proof2 %>% 
  filter(Intervals != -1) %>% 
  group_by(Month) %>% 
  ggplot(aes(fill=member_casual, y = percentage , x = Intervals)) + 
  geom_bar(position="dodge", stat="identity")+
  theme(axis.text.x = element_text(angle = 45))+
  ggtitle("Percentage of Riders traveling a given distance")+
  labs(y = "Percentage by Type of Rider",caption = "12 months of 2021", 
       fill = "Type of Rider")+
  scale_x_continuous(breaks = seq(0,0.1,0.01),limits = c(0,0.1))+
  scale_fill_brewer(palette = "Paired" )+
  facet_wrap(~Month)



#################################################################################################
# This part is for testing stuff


  