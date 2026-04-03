#Activity 1
# 1.1. Pearson Correlation using cor()
x <- c(1, 2, 3, 4, 5, 6, 7)
y <- c(1, 3, 6, 2, 7, 4, 5)
result_cor <- cor(x, y, method = "pearson")
cat("Pearson correlation coefficient is:", result_cor)
# 1.2. Correlation Testing using cor.test()
# This provides more detail, including the p-value
result_test <- cor.test(x, y, method = "pearson")
print(result_test)
# 1.3. Visualize Correlation Matrix using Correlogram
install.packages("corrplot")
install.packages("RColorBrewer")
library(corrplot)
library(RColorBrewer)
M <- cor(mtcars)
corrplot(M, type = "upper")
# Advanced visualization with hierarchical clustering and colors
corrplot(M, type = "upper", order = "hclust", 
         col = brewer.pal(n = 8, name = "RdYlBu"))


#Activity 2
# 2.1. Prepare and Melt Correlation Matrix
install.packages("lattice")
install.packages("reshape2")
library(lattice)
library(reshape2)
data_env <- environmental
corr_mat <- round(cor(data_env), 2)
# Reorder matrix based on hierarchical clustering
dist_mat <- as.dist((1 - corr_mat) / 2)
hc <- hclust(dist_mat)
corr_mat <- corr_mat[hc$order, hc$order]
# Melt the matrix for ggplot2
melted_corr_mat <- melt(corr_mat)
# 2.2. Correlation Heatmap using ggplot2
library(ggplot2)
ggplot(data = melted_corr_mat, aes(x = Var1, y = Var2, fill = value)) + 
  geom_tile() + 
  geom_text(aes(Var2, Var1, label = value), color = "white", size = 4)
# 2.3. Interactive Heatmap using heatmaply
install.packages("heatmaply")
library(heatmaply)
heatmaply_cor(x = cor(data_env), xlab = "Features", ylab = "Features", k_col = 2, k_row = 2)
# 2.4. Simple Heatmap using ggcorrplot
install.packages("ggcorrplot")
library(ggcorrplot)
ggcorrplot(cor(data_env))


#Activity 3
# Create sample data
mydata <- c(244, 753, 596, 645, 874, 141, 639, 465, 999, 654)
# 3.1. Log Transformation
# Useful for handling skewed data
scaled_data1 <- log(mydata)
print(scaled_data1)
# 3.2. Standard Scaling (Z-score Normalization)
# Rescales data to have a mean of 0 and standard deviation of 1
scaled_data2 <- as.data.frame(scale(mydata))
print(scaled_data2)
# 3.3. Min-Max Scaling
# Rescales data to a specific range, usually [0, 1]
install.packages("caret")
library(caret)
minmax_proc <- preProcess(as.data.frame(mydata), method = c("range"))
scaled_data3 <- predict(minmax_proc, as.data.frame(mydata))
print(scaled_data3)
# 3.4. Compare Summary Statistics
summary(mydata)        # Raw Data
summary(scaled_data1)  # Log Scaled
summary(scaled_data2)  # Standard Scaled (Mean will be 0)
summary(scaled_data3)  # Min-Max Scaled (Min 0, Max 1)