# Logistic Regression using R. 

# http://www.tatvic.com/blog/logistic-regression-using-r/

# Instructions
# -----------


# This file contains R code that helps you get started on logistic regression with R.
# We first recommend you to download sample dataset.  

# Set Wprking Directory, e.g. "D:/dir_name/......"
# Put the data set in working directory
setwd("Your working directory")

# Read data from csv file 
# The first two columns contains the exams scores and third columns contains labels 
data<-read.csv(file="Marks.csv",head=TRUE,sep=',')

# Predictor variables
exam_1<-data$exam_1
exam_2<-data$exam_2

# Response variables
admitted<-data$admitted

# Regression model
Model_1<-glm(admitted ~ exam_1 +exam_2, family = binomial("logit"), data=data)

# Summary of the model
summary(Model_1)

# Input data frame for prediction
# Try with diffrent combinations of exam_1 and exam_2 e.g. exam_1=35 and exam_2=46,etc.
in_frame<-data.frame(exam_1=60,exam_2=86)

# Predict function to make prediction
predict(Model_1,in_frame, type="response")

# Round probability score to 1 or 0 to decide whether student will get admission or not
round(predict(Model_1,in_frame, type="response"))