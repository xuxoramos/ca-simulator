# Libraries
library(tidyverse)  # data manipulation
library(dbscan) # clustering algorithms & visualization

# Load files
rwasplus_final <- readRDS(file = './data/rwasplus_final.rdata')

# Load dissimilitude matrix
gower_dissim_matrix <- readRDS(file = "./data/gower_dissim_matrix.rdata")

# Create clusters
clusters <- dbscan(gower_dissim_matrix, minPts = 4, eps = 5)

