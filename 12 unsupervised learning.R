# Load necessary libraries
library(ggplot2)  # For plotting
library(cluster)  # For kmeans clustering

# Load the iris dataset
data(iris)

# Select only the numeric columns (excluding species)
iris_numeric <- iris[, -5]

# Perform k-means clustering with k = 3
kmeans_result <- kmeans(iris_numeric, centers = 3)

# Add cluster assignments to the dataset
iris_clustered <- cbind(iris_numeric, Cluster = kmeans_result$cluster)

# Plot the clusters
ggplot(iris_clustered, aes(x = Sepal.Length, y = Sepal.Width, color = factor(Cluster))) +
  geom_point() +
  labs(title = "K-means Clustering of Iris Dataset",
       x = "Sepal Length", y = "Sepal Width") +
  theme_minimal()
