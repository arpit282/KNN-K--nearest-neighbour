###########################################################################
#######################  K-Nearest Neighbour (KNN)  #####################3

setwd("E:/R (Data Science)/excel files")     ######  uses your working directory

data <- read.csv("Prostate_Cancer.csv")

data <- data[,-1]

str(data)

t <-table(data$diagnosis_result)
pie(t)


# Normalisation 

normalise <- function(x){
  return( (x - min(x)) / (max(x)- min(x)))     ### 0-1
}


data_n <- as.data.frame(lapply(data[2:9], normalise))

### training and test set 
train <- data_n[1:70,]
test <- data_n[71:100,]


### train and test labels
train_lab <- data[1:70,1]
test_lab <- data[71:100,1]
table(test_lab)

### Knn 
install.packages("class")
library(class)

k <- sqrt(nrow(data))  #### K is determined by square root of no . of rows

model <- knn(train = train,test = test,cl = train_lab, k= 9)
table(model)


t1 <- table(Prediction =model, Actual=test_lab)
sum(diag(t1))/sum(t1)






















