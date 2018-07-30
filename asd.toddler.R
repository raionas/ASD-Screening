# Exploratory Analysis toddler dataset
# install required packages
install.packages("mlr")  # create maps
install.packages("Amelia")  # create maps
install.packages("mlbench") # benchmark
install.packages("kableExtra") # data summary
install.packages("knitr") # data summary
install.packages("corrr")
install.packages("corrplot") # to obtain ideas of which variables change together

# load libraries
library(mlr)
library(Amelia)
library(mlbench)
library(kableExtra)
library(knitr)
library(corrr)
library(rpart)
library(corrplot)

# load dataset
asd <- read.csv('toddler.csv')

#rename variables
names(asd) <- c("A1_Mark", "A2_Mark", "A3_Mark", "A4_Mark", "A5_Mark", "A6_Mark", "A7_Mark", "A8_Mark", "A9_Score", "A10_Mark", "Age", "QScore", "Sex", "Ethnicity", "Born.With.Jaundice", "Family.ASD.History", "Whois.Completing.Test", "Class.ASD")

# create a missing map
# dataset contains nil missing data
missmap(asd)

# remove missing data
asd.na <- na.omit(asd)

# general summary
kable(asd.na)

# Summary of data
kable(summarizeColumns(asd.na))

# load asd dataset
data(asd)
# data correlation
# calculate correlations
correlations <- cor(asd[,1:12])
# create correlation plot
corrplot(correlations, method="square")
