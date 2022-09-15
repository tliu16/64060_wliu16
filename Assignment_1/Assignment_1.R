# data source from Kaggle: https://www.kaggle.com/datasets/yersever/500-person-gender-height-weight-bodymassindex?resource=download
# additional info: Height(cm), Weight(KG), Index 0-Extremely weak, 1- weak, 
# 2- normal, 3-overweight, 4- obesity, 5- extreme obesity
# set working directory
setwd("~/Desktop/R/64060/Assignment_1")
library(tidyverse)

# load the file 
health_data <- read.table("500_Person_Gender_Height_Weight_Index.csv", TRUE, ",")

# display the dataset structure
str(health_data)

# display the dataset summary
summary(health_data)

# print out 6 row of the total data
head(health_data)

# count the number of individuals with various fitness levels
table(health_data$Index)

# rearrange the table based on Height column in ascending order 
health_data_arrange1 <- health_data %>% arrange(Height)
View(health_data_arrange1)

health_data_filter1<- health_data %>% filter(Index == 3)
View(health_data_filter1)

# convert the Height(cm) to meter
Height_M <- health_data$Height/100
# calculate and print BMI = KG/(M^2)
BMI <- health_data$Weight/(Height_M^2)
head(BMI)

# height and weight distribution
par(mfrow = c(1,2))
counts_h <- table(health_data$Height)
counts_w <- table(health_data$Weight)
barplot(counts_h, main = "Height Distribution", xlab= "Height(cm)")
barplot(counts_w, main = "Weight Distribution", xlab= "Weight(kg)")

# height and weight scatterplot and BMI scatterplot
par(mfrow = c(1,2))
plot(health_data$Weight, health_data$Height, main = "Height vs Weight",
     xlab = "Weight", ylab= "Height", pch=19)
plot(health_data$Weight, BMI, main = "BMI vs Weight",
     xlab = "Weight", ylab= "BMI",pch =18)
