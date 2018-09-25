## Archel Aguilar
## Melbourne Housing EDA

# Archel Aguilar
# Avocado EDA


library(dplyr)
library(magrittr)
library(lubridate)
library(tibble)
library(tidyr)
library(ggplot2)
library(naniar)
library(purrr)
library(Amelia)
library(plotly)
library(Metrics)
library(stringr)


mh = read.csv("Melbourne_housing_FULL.csv", stringsAsFactors = FALSE)

options(scipen=999)

#https://www.kaggle.com/anthonypino/melbourne-housing-market/home


mh %>%
  View


str(mh)

mhc = mh %>%
  mutate(
    DateSold = dmy(Date),
    L_Price = log(Price),
    L_Landsize = log(Landsize)
  ) %>%
  filter(!is.na(Price))  %>%
  filter(!is.na(Rooms)) %>%
  filter(!is.na(Bedroom2)) %>%
  filter(!is.na(Bathroom)) %>%
  filter(!is.na(Car)) %>%
  filter(!is.na(Landsize)) %>%
  filter(Landsize !=0)
  
mhc %>%
  select(
    L_Price,
    Rooms,
    Bedroom2,
    Bathroom,
    Car,
    L_Landsize
  ) %>%
  pairs()

install.packages("corrplot")
library(corrplot)

mhc.corr = mhc %>%
  select(
    L_Price,
    Rooms,
    Bedroom2,
    Bathroom,
    Car,
    L_Landsize
  ) 

corrplot.mixed(cor(mhc.corr))

