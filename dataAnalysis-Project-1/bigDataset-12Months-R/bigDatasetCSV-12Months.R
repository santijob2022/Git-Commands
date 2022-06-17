library(tidyverse)
library(readxl)

# First we upload the excel worksheet by month, we inititiate with januare and februar.

excelFile2 <- read.csv("202101-divvy-tripdata.csv",header = TRUE)
bigDataset <- excelFile2
str(excelFile2)

excelFile2 <- read.csv("202102-divvy-tripdata.csv",header = TRUE)
bigDataset <- rbind(bigDataset, excelFile2)
str(excelFile2)

excelFile2 <- read.csv("202103-divvy-tripdata.csv",header = TRUE)
bigDataset <- rbind(bigDataset, excelFile2)
str(excelFile2)

excelFile2 <- read.csv("202104-divvy-tripdata.csv",header = TRUE)
bigDataset <- rbind(bigDataset, excelFile2)

excelFile2 <- read.csv("202105-divvy-tripdata.csv",header = TRUE)
bigDataset <- rbind(bigDataset, excelFile2)
str(excelFile2)

excelFile2 <- read.csv("202106-divvy-tripdata.csv",header = TRUE)
bigDataset <- rbind(bigDataset, excelFile2)
str(excelFile2)

excelFile2 <- read.csv("202107-divvy-tripdata.csv",header = TRUE)
bigDataset <- rbind(bigDataset, excelFile2)
str(excelFile2)

excelFile2 <- read.csv("202108-divvy-tripdata.csv",header = TRUE)
bigDataset <- rbind(bigDataset, excelFile2)

excelFile2 <- read.csv("202109-divvy-tripdata.csv",header = TRUE)
bigDataset <- rbind(bigDataset, excelFile2)

excelFile2 <- read.csv("202110-divvy-tripdata.csv",header = TRUE)
bigDataset <- rbind(bigDataset, excelFile2)
str(excelFile2)

excelFile2 <- read.csv("202111-divvy-tripdata.csv",header = TRUE)
bigDataset <- rbind(bigDataset, excelFile2)

excelFile2 <- read.csv("202112-divvy-tripdata.csv",header = TRUE)
bigDataset <- rbind(bigDataset, excelFile2)

write.csv(bigDataset,"bigDatasetCSV.csv")

write.csv(bigDataset,"proof3Months.csv")
remove(excelFile2)
remove(bigDataset)

str(bigDataset)
