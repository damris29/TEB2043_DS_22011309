#Activity 1
library(dplyr)
# 1. Load and clean the Titanic data (as done in Lab 7)
titanic <- read.csv("titanic.csv")
titanic_clean <- na.omit(titanic)
# 2. Plot 1: Bar Chart of Survival by Passenger Class
# Insight: Shows which class had the most survivors
survival_counts <- table(titanic_clean$survived, titanic_clean$class)
barplot(survival_counts, 
        main = "Survival by Passenger Class",
        xlab = "Class", ylab = "Number of Passengers",
        col = c("red", "green"),
        legend = c("Died", "Survived"), 
        beside = TRUE)
# 3. Plot 2: Box Plot of Fare by Survival Status
# Insight: Investigating if those who paid more had higher survival rates
boxplot(fare ~ survived, data = titanic_clean,
        main = "Fare Distribution by Survival",
        xlab = "Survived (0 = No, 1 = Yes)",
        ylab = "Fare Paid",
        col = c("orange", "lightblue"),
        names = c("Died", "Survived"))


#Activity 2
# 1. Load the built-in dataset
data("AirPassengers")
# 2. Visualize using a Line Graph
# Insight: A clear upward trend and seasonal spikes every year
plot(AirPassengers, 
     type = "o", 
     col = "blue", 
     main = "Monthly Airline Passenger Growth (1949-1960)",
     xlab = "Year", 
     ylab = "Total Passengers (in thousands)")
# 3. Adding a trend line to highlight the steady increase
abline(reg = lm(AirPassengers ~ time(AirPassengers)), col = "red", lwd = 2)
# 4. Summary for the "Sales Manager" story
print("Summary of Passenger Data:")
summary(AirPassengers)


# ============================================================
# CONCLUSION REPORT & DATA STORY
# ============================================================
# 
# [Activity 1: Titanic Insights]
# 1. Class Disparity: The Bar Chart reveals that while Third Class 
#    had the highest total number of passengers, the green bars 
#    (survivors) are significantly taller in First Class relative 
#    to their total count.
# 2. Economic Factor: The Box Plot shows a higher median fare for 
#    those who survived. This supports the insight that higher-paying 
#    passengers likely had prioritized access to safety protocols.
#
# [Activity 2: The AirPassengers Story - Presentation to Management]
# "Good morning, Team. Our analysis of the AirPassengers dataset 
# reveals a decade of consistent, aggressive growth for the airline 
# industry. 
#
# Key Findings:
# - Steady Growth: The red trend line indicates a non-stop upward 
#   trajectory in passenger volume from 1949 to 1960.
# - Seasonality: Notice the repeated 'sawtooth' pattern. Every year, 
#   we see massive spikes during the summer months. 
# - Strategic Recommendation: Based on this 11-year pattern, the Sales 
#   Manager should increase fleet capacity and staffing specifically 
#   during mid-year peaks to maximize revenue during these high-demand 
#   periods."
#
# ============================================================