#Activity 1
# 1.1. List all pre-loaded data
data()
# 1.2. Loading the 'mtcars' dataset
data(mtcars)
print(head(mtcars, 10)) # Print first 10 rows
# Store specific columns (mpg and cyl)
input <- mtcars[, c('mpg', 'cyl')]
print(head(input)) # Print first 5 rows


#Activity 2
#Pie Chart
# Data for the graph
x <- c(21, 62, 10, 53)
labels <- c("London", "New York", "Singapore", "Mumbai")
# Basic Pie Chart with Title and Colors
pie(x, labels, main = "City pie chart", col = rainbow(length(x)))
# Pie Chart with Percentages and Legend
piepercent <- round(100 * x / sum(x), 1)
pie(x, labels = piepercent, main = "City pie chart", col = rainbow(length(x)))
legend("topright", c("London", "New York", "Singapore", "Mumbai"), 
       cex = 0.8, fill = rainbow(length(x)))
# 3D Pie Chart (Requires 'plotrix' library)
library(plotrix)
pie3D(x, labels = labels, explode = 0.1, main = "Pie Chart of Countries")

#Box Plot and Histogram
# Box Plot showing Mileage vs Cylinders
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders", 
        ylab = "Miles Per Gallon", main = "Mileage Data", 
        col = c("green", "yellow", "purple"), names = c("High", "Medium", "Low"))
# Histogram for frequency distribution
v_data <- c(9, 13, 21, 8, 36, 22, 12, 41, 31, 33, 19)
hist(v_data, xlab = "Weight", col = "yellow", border = "blue", 
     xlim = c(0, 50), ylim = c(0, 5), breaks = 5)

#Scatterplots
# Simple Scatterplot: Weight vs Mileage
plot(x = mtcars$wt, y = mtcars$mpg, xlab = "Weight", ylab = "Milage", 
     main = "Weight vs Milage", col = "blue")
# Scatterplot Matrix for multiple variables
pairs(~wt + mpg + disp + cyl, data = mtcars, main = "Scatterplot Matrix")

#Bar Charts and Linegraphs
# Grouped Bar Chart
H_vals <- c(7, 12, 28, 3, 41)
M_labels <- c("Mar", "Apr", "May", "Jun", "Jul")
barplot(H_vals, names.arg = M_labels, xlab = "Month", ylab = "Revenue", 
        col = "blue", main = "Revenue chart", border = "red")
# Line Graph with multiple lines
v_line <- c(7, 12, 28, 3, 41)
t_line <- c(14, 7, 6, 19, 3)
plot(v_line, type = "o", col = "red", xlab = "Month", ylab = "Rain fall", 
     main = "Rain fall chart")
lines(t_line, type = "o", col = "blue")