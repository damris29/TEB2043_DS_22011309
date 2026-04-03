#Activity 1
# 1. Load the dataset
data("ToothGrowth")
# 2. Prepare data for correlation
# We convert the supplement factor to numeric to include it in the correlation
tg_data <- ToothGrowth
tg_data$supp <- as.numeric(tg_data$supp)
# 3. Compute correlation matrix
tg_corr <- cor(tg_data)
print("Correlation Matrix for ToothGrowth:")
print(tg_corr)
# 4. Plot Correlation Heatmap
library(ggcorrplot)
ggcorrplot(tg_corr, lab = TRUE, title = "ToothGrowth Correlation Heatmap")


#Activity 2
# 1. Load dataset
data("mtcars")
# We will use 'mpg' (Miles Per Gallon) as our sample column for comparison
raw_mpg <- mtcars$mpg
# 2. Log Transformation
log_mpg <- log(raw_mpg)
# 3. Standard Scaling (Z-score)
standard_mpg <- scale(raw_mpg)
# 4. Min-Max Scaling (Requires caret)
library(caret)
process_minmax <- preProcess(as.data.frame(raw_mpg), method = c("range"))
minmax_mpg <- predict(process_minmax, as.data.frame(raw_mpg))
# 5. Compare Results
print("Summary of Raw MPG:")
print(summary(raw_mpg))
print("Summary of Log Transformed MPG:")
print(summary(log_mpg))
print("Summary of Standard Scaled MPG (Mean should be 0):")
print(summary(standard_mpg))
print("Summary of Min-Max Scaled MPG (Range should be 0 to 1):")
print(summary(minmax_mpg))


# ============================================================
# DISCUSSION: ACTIVITY 1 - TOOTHGROWTH INSIGHTS
# ============================================================
#
# 1. POSITIVE CORRELATION (Dose vs Length):
#    The analysis shows a strong positive correlation between 'dose' 
#    and 'len'[cite: 876]. This indicates that higher dosages of 
#    Vitamin C directly result in increased tooth length in guinea pigs.
#
# 2. SUPPLEMENT TYPE IMPACT:
#    By converting 'supp' to a numeric value, the correlation matrix 
#    helps identify if the delivery method (OJ vs VC) has a linear 
#    influence on the growth results alongside the dosage[cite: 876].
#
# 3. HEATMAP OBSERVATIONS:
#    The heatmap visually confirms that 'dose' is the most significant 
#    predictor of 'len'[cite: 876]. The color intensity highlights 
#    that as dosage levels move from 0.5 to 2.0, the growth response 
#    becomes more pronounced.
#
# 4. DATA SCIENCE APPLICATION:
#    These findings suggest that 'dose' is a primary feature for any 
#    predictive modeling. Understanding these relationships is 
#    essential before applying normalization or further machine 
#    learning algorithms[cite: 877].
#
# ============================================================