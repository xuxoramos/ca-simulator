# Libraries
library(cluster)
library(tidyverse)  # data manipulation
library(factoextra) # clustering algorithms & visualization

# Load files
rwasplus_final <- readRDS(file = './data/rwasplus_final.rdata')

# k-means with mixed categorical and numeric data
gower_dissim_matrix <- daisy(rwasplus_final, metric = "gower", stand = T)

# Save dissimilarity matrix
saveRDS(gower_dissim_matrix, file = "./data/gower_dissim_matrix.rdata")

# Load dissimilitude matrix
gower_dissim_matrix <- readRDS(file = "./data/gower_dissim_matrix.rdata")

# Calculate medoids
pam_medoids <- pam(x = gower_dissim_matrix, k = 10, diss = T)

# plot dissimilarity matrix and groups around medoids
fviz_cluster(object = list(data = gower_dissim_matrix, cluster = 
                             pam_medoids$clustering))
