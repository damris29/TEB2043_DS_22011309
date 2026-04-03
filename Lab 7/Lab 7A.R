#Activity 1
# 1.1. Installing and loading library
install.packages("readxl")
library(readxl)
# Verify installation
any(grepl("readxl", installed.packages()))
# 1.2. Set working directory (Update the path to your specific folder)
getwd()
# setwd('C:/Users/User/Desktop') # Example of how to change it
list.files()
# 1.3. Importing Excel file
uforeport <- read_excel("uforeport.xls")
View(uforeport)
# 1.4. Importing CSV file (no extra library required)
titanic <- read.csv("titanic.csv")
View(titanic)


#Activity 2
# 2. Identify NA values
sum(is.na(uforeport))
sum(is.na(titanic))
# Get positions of NA values
which(is.na(uforeport))
# Count NA in each specific column
print(sapply(uforeport, function(x) sum(is.na(x))))
print(sapply(titanic, function(x) sum(is.na(x))))


#Activity 3
# 3. Clean the data by removing rows with NA
uforeport_cleaned <- na.omit(uforeport)
titanic_cleaned <- na.omit(titanic)
# Compare dimensions before and after cleaning
dim(uforeport)
dim(uforeport_cleaned)


#Activity 4
# 4.1. Setup dplyr for filtering
install.packages("dplyr")
library(dplyr)
# 4.3. Clean column names (Replacing blanks with underscores)
names(uforeport_cleaned) <- gsub(" ", "_", colnames(uforeport_cleaned))
# 4.4. Basic Filtering
print(filter(uforeport_cleaned, City == 'Belton'))
print(filter(titanic_cleaned, sex == 'female'))


#Activity 5
# 5.1. Filtering by multiple conditions
# Find females who paid a fare > 500
print(filter(titanic_cleaned, sex == 'female' & fare > 500))
# Using the pipe (%>%) operator for Green UFO reports
ufo_green <- uforeport_cleaned %>% filter(Colors_Reported == 'GREEN')


#Activity 6
# 6.1. Sorting (Arranging)
# Sort by descending fare (highest to lowest)
titanic_sortbyfare <- arrange(titanic_cleaned, desc(fare))


#Activity 7
# 7. Exporting to new files
# Save as Excel (requires xlsx package)
install.packages("xlsx")
library(xlsx)
write.xlsx(ufo_green, "ufo_green.xlsx")
# Save as CSV
write.csv(titanic_sortbyfare, "titanic_sortbyfare.csv")