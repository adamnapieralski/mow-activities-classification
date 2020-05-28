library(caret)
library(Boruta)
library(e1071)
library(randomForest)
library(ROCR)
library(pROC)


remove(list=ls())
source("preprocessing_data.R")
source("preprocessing_class.R")

withAllClasses=TRUE
all_data<-load_and_preprocess_data(withAllClasses)
all_classes<-load_and_preprocess_classes(withAllClasses)

# bind data with classes
all_data_and_classes <-cbind(all_data, all_classes)

# partition data 1:4
train_index = createDataPartition(all_data_and_classes$Class, p=.8, list=FALSE, times=1)
train_data_and_classes <- all_data_and_classes[train_index,]
validate_data_and_classes <- all_data_and_classes[-train_index,]

train_data <- all_data[train_index,]
validate_data <- all_data[-train_index,]
train_classes <- all_classes[train_index,]
validate_classes <- all_classes[-train_index,]


# long 7h run...
# BorutaOnTraining250 <- Boruta(Class~.,data=train_data_and_classes, maxRuns=250, doTrace=2)

# load only important attibutes selected by Boruta
important_attributes <- read.csv("boruta_out/boruta_250_important_tentative.csv")
# drop not important attributes
 train_data <- subset(train_data, select = c(important_attributes[,2]))
 validate_data<-subset(validate_data, select = c(important_attributes[,2]))
#Data_binding
train_all <- cbind(train_data,train_classes);
validate_all<-cbind(validate_data,validate_classes)
colnames(train_all)[which(names(train_all) == "train_classes")] <- "Class"
colnames(validate_all)[which(names(validate_all) == "validate_classes")] <- "Class"

#NaiveBayes
source("naiveBayes_classification.R")
#set.seed(1234)
naiveBayes_classification(train_all, validate_all)
#RandomForest
source("RandomForest_classification.R")
RandomForest_classification(train_all,validate_all)

