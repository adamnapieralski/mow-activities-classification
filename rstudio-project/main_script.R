library(caret)
library(Boruta)
library(e1071)
library(randomForest)
library(ROCR)
library(pROC)
library(rpart)

# parametr ustalajacy czy analiza przeprowadzana jest dla wszystkich 12 klas (w tym mało licznych 7-12)
# czy tylko klas nieprzejściowych (1-6)
withAllClasses = FALSE


set.seed(1234)

remove(list=ls())
source("preprocessing_data.R")
source("preprocessing_class.R")

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

train_classes <- data.frame(all_classes[train_index,])
validate_classes <- data.frame(all_classes[-train_index,])
colnames(train_classes) <- c("Class")
colnames(validate_classes) <- c("Class")
train_data_and_classes <- cbind(train_data, train_classes)


# long 8h run...
# BorutaOnTraining250 <- Boruta(Class~.,data=train_data_and_classes, maxRuns=250, doTrace=2)

# load only important attibutes selected by Boruta
important_attributes <- read.csv("boruta_out/boruta_250_important_tentative.csv")

# drop not important attributes
train_data <- subset(train_data, select = c(important_attributes[,2]))
validate_data <- subset(validate_data, select = c(important_attributes[,2]))

# Data_binding
train_all <- cbind(train_data,train_classes);
validate_all<-cbind(validate_data,validate_classes)
colnames(train_all)[which(names(train_all) == "train_classes")] <- "Class"
colnames(validate_all)[which(names(validate_all) == "validate_classes")] <- "Class"

# NaiveBayes
source("naiveBayes_reduced_classification.R")
naiveBayes_reduced_classification(train_all, validate_all)

# RandomForest
source("RandomForest_classification.R")
RandomForest_classification(train_all,validate_all)

# SVM
source("svm_classification.R")
svm_data_all_classes <- svm_classification(train_data_and_classes, validate_data_and_classes)

# Decision Trees
source("tree_classification.R")
tree_data_all_classes <- tree_classification(train_data_and_classes, validate_data_and_classes)

