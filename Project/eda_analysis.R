# Read the dataset
df <- read.csv("fifa_player_performance_market_value.csv")
names(df) <- tolower(gsub("[^a-zA-Z0-9]", "_", names(df)))

cat("===== DATASET STRUCTURE =====\n")
str(df)

cat("\n===== SUMMARY STATISTICS =====\n")
summary(df)

cat("\nRows:", nrow(df), "| Columns:", ncol(df), "\n")

cat("\n===== MISSING VALUES =====\n")
missing <- colSums(is.na(df))
print(missing[missing > 0])
if (all(missing == 0)) {
  cat("No missing values found in the dataset.\n")
}

#Visualizations
par(mfrow = c(2, 2))

#Histogram of Age
hist(df$age, 
     main = "Distribution of Player Ages",
     xlab = "Age", ylab = "Count",
     col = "#2196F3", border = "white")

#Histogram of Market Value
hist(df$market_value_million_eur,
     main = "Distribution of Market Value",
     xlab = "Market Value (Million EUR)", ylab = "Count",
     col = "#4CAF50", border = "white")

#Bar Chart of Position
pos_counts <- sort(table(df$position), decreasing = TRUE)
barplot(pos_counts,
        main = "Number of Players by Position",
        xlab = "Position", ylab = "Count",
        col = "#FF9800", border = "white",
        las = 2, cex.names = 0.8)

#Scatterplot of Overall Rating vs Market Value
plot(df$overall_rating, df$market_value_million_eur,
     main = "Overall Rating vs Market Value",
     xlab = "Overall Rating",
     ylab = "Market Value (Million EUR)",
     col = adjustcolor("#9C27B0", alpha.f = 0.4),
     pch = 16)

par(mfrow = c(1, 1))

#Top 5 Most Valuable Players
cat("\n===== TOP 5 MOST VALUABLE PLAYERS =====\n")
top5 <- df[order(-df$market_value_million_eur), ]
print(top5[1:5, c("player_name", "age", "club", "position",
                   "overall_rating", "market_value_million_eur")])
