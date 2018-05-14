# Libraries
library(cluster)
library(readr)
library(HSAUR)
library(tidyverse)  # data manipulation
library(kamila)
library(factoextra) # clustering algorithms & visualization

# Load data
rwasplus <- read_csv('./data/RWAS/modified_data_copy.csv')
names(rwasplus)[21] <- 'Homosexuals_feminists_praised_for_defy_traditional_values' # clean this particular column
rwasplus_numeric <- rwasplus %>% select(c(1:32,38,45))
rwasplus_categorical <- rwasplus %>% select(c(33:37,39:44))
rwasplus_categorical[names(rwasplus_categorical)] <- lapply(rwasplus_categorical[names(rwasplus_categorical)], factor)

# k-means with mixed categorical and numeric data
clusters <- kamila(conVar = rwasplus_numeric, catFactor = rwasplus_categorical, numClust = 3, numInit = 100)
#k_clusters <- kmeans(rwasplus, centers = 1, iter.max = 100, nstart = 4)

# plot
fviz_cluster(k_clusters, data = rwasplus)

# silhouette plot
dissE <- daisy(rwas) 
dE2   <- dissE^2
sk2   <- silhouette(groups$cl, dE2)
plot(sk2)
