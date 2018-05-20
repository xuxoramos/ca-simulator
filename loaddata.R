# Libraries
library(readr)
library(tidyverse)  # data manipulation

# Load and clean data
# Read-in RWAS + Big5 data
rwasplus <- read_csv('./data/RWAS/modified_data_copy.csv')
# Fix column due to windows import
names(rwasplus)[21] <- 'Homosexuals_feminists_praised_for_defy_traditional_values' # clean this particular column
# Remove uncomplete cases for easier clustering
rwasplus <- rwasplus %>% na.omit
# Separate numeric columns
rwasplus_numeric <- rwasplus %>% select(c(1:32,38,45))
# Create sequence as key
rwasplus_numeric <- rwasplus_numeric %>% mutate(id = seq(1:nrow(rwasplus_numeric)))
# Separate categorical columns
rwasplus_categorical <- rwasplus %>% select(c(33:37,39:44))
# Turn them all to factor
rwasplus_categorical[names(rwasplus_categorical)] <- lapply(rwasplus_categorical[names(rwasplus_categorical)], factor)
# Create sequence as key
rwasplus_categorical <- rwasplus_categorical %>% mutate(id = seq(1:nrow(rwasplus_categorical)))
# Join categorical and numeric columns
rwasplus_final <- rwasplus_numeric %>% inner_join(x = rwasplus_numeric, y = rwasplus_categorical, by = 'id')

# Write out files
saveRDS(rwasplus_categorical, file = "./data/rwasplus_categorical.rdata")
saveRDS(rwasplus_numeric, file = "./data/rwasplus_numeric.rdata")
saveRDS(rwasplus_final, file = "./data/rwasplus_final.rdata")