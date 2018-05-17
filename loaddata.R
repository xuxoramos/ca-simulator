# Libraries
library(cluster)
library(readr)
library(tidyverse)  # data manipulation
library(factoextra) # clustering algorithms & visualization

# Load data
rwasplus <- read_csv('./data/RWAS/modified_data_copy.csv')
names(rwasplus)[21] <- 'Homosexuals_feminists_praised_for_defy_traditional_values' # clean this particular column
rwasplus <- rwasplus %>% na.omit
rwasplus_numeric <- rwasplus %>% select(c(1:32,38,45))
rwasplus_numeric <- rwasplus_numeric %>% mutate(id = seq(1:nrow(rwasplus_numeric)))
rwasplus_categorical <- rwasplus %>% select(c(33:37,39:44))
rwasplus_categorical[names(rwasplus_categorical)] <- lapply(rwasplus_categorical[names(rwasplus_categorical)], factor)
rwasplus_categorical <- rwasplus_categorical %>% mutate(id = seq(1:nrow(rwasplus_categorical)))
rwasplus_final <- rwasplus_numeric %>% inner_join(x = rwasplus_numeric, y = rwasplus_categorical, by = 'id')

# k-means with mixed categorical and numeric data
#gower_dissim_matrix <- daisy(select(rwasplus_final, -46), metric = "gower")
gower_dissim_matrix <- daisy(rwasplus_final, metric = "gower")
saveRDS(daisy_dissim_matrix, file = "./data/gower_dissim_matrix.rdata")

# Load dissimilitude matrix
gower_dissim_matrix <- readRDS(file = "./data/gower_dissim_matrix.rdata")
pam_medoids <- pam(x = gower_dissim_matrix, k = 3, diss = T)

# plot IMPORTANT
fviz_cluster(object = list(data = gower_dissim_matrix, cluster = 
                             pam_medoids$clustering))

