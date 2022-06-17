library(tidyverse)
library(readxl)

# First we upload the excel worksheet by month, we inititiate with januare and februar.

remove(excelFile2)

excelFile2 <- read_excel("202101-divvy-tripdata.xlsx", sheet = "202101-divvy-tripdata")
bigDataset <- rbind(bigDataset, excelFile2)
unlink(excelFile2)

excelFile2 <- read_excel("202102-divvy-tripdata.xlsx", sheet = "202102-divvy-tripdata")
bigDataset <- rbind(bigDataset, excelFile2)

excelFile2 <- read_excel("202103-divvy-tripdata.xlsx", sheet = "202103-divvy-tripdata")
bigDataset <- rbind(bigDataset, excelFile2)

excelFile2 <- read_excel("202104-divvy-tripdata.xlsx", sheet = "202104-divvy-tripdata")
bigDataset <- rbind(bigDataset, excelFile2)

excelFile2 <- read_excel("202105-divvy-tripdata.xlsx", sheet = "202105-divvy-tripdata")
bigDataset <- rbind(bigDataset, excelFile2)

excelFile2 <- read_excel("202106-divvy-tripdata.xlsx", sheet = "202106-divvy-tripdata")
bigDataset <- rbind(bigDataset, excelFile2)

excelFile2 <- read_excel("202107-divvy-tripdata.xlsx", sheet = "202107-divvy-tripdata")
bigDataset <- rbind(bigDataset, excelFile2)

excelFile2 <- read_excel("202108-divvy-tripdata.xlsx", sheet = "202108-divvy-tripdata")
bigDataset <- rbind(bigDataset, excelFile2)

excelFile2 <- read_excel("202109-divvy-tripdata.xlsx", sheet = "202109-divvy-tripdata")
bigDataset <- rbind(bigDataset, excelFile2)

excelFile2 <- read_excel("202110-divvy-tripdata.xlsx", sheet = "202110-divvy-tripdata")
bigDataset <- rbind(bigDataset, excelFile2)

excelFile2 <- read_excel("20211-divvy-tripdata.xlsx", sheet = "202111-divvy-tripdata")
bigDataset <- rbind(bigDataset, excelFile2)

excelFile2 <- read_excel("202112-divvy-tripdata.xlsx", sheet = "202112-divvy-tripdata")
bigDataset <- rbind(bigDataset, excelFile2)

