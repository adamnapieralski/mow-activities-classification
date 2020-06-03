library(caret)
library(Boruta)
library(e1071)
library(randomForest)
library(ROCR)
library(pROC)
library(rpart)


remove(list=ls())
source("preprocessing_data.R")
source("preprocessing_class.R")

withAllClasses=FALSE
all_data<-load_and_preprocess_data(withAllClasses)
all_classes<-load_and_preprocess_classes(withAllClasses)

# bind data with classes
all_data_and_classes <-cbind(all_data, all_classes)

# partition data 1:4
train_index_reduced<-readRDS(file = "train_index_reduced.rds")
# train_index = createDataPartition(all_data_and_classes$Class, p=.8, list=FALSE, times=1)
train_data_and_classes <- all_data_and_classes[train_index_reduced,]
validate_data_and_classes <- all_data_and_classes[-train_index_reduced,]

train_data <- all_data[train_index_reduced,]
validate_data <- all_data[-train_index_reduced,]
train_classes <- all_classes[train_index_reduced,]
validate_classes <- all_classes[-train_index_reduced,]


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
source("naiveBayes_reduced_classification.R")
set.seed(1234)
naiveBayes_reduced_classification(train_all, validate_all)
#RandomForest
source("RandomForest_classification.R")
set.seed(1234)
random_data_reduced<-RandomForest_classification(train_all,validate_all)


#Dla wszystkich klas
withAllClasses=TRUE
all_data_all<-load_and_preprocess_data(withAllClasses)
all_classes_all<-load_and_preprocess_classes(withAllClasses)

all_data_and_classes_all <-cbind(all_data_all, all_classes_all)

# partition data 1:4
train_index_full<-readRDS(file = "train_index_full.rds")
# train_index = createDataPartition(all_data_and_classes_all$Class, p=.8, list=FALSE, times=1)
train_data_and_classes_all <- all_data_and_classes_all[train_index_full,]
validate_data_and_classes_all <- all_data_and_classes_all[-train_index_full,]

train_data_all <- all_data_all[train_index_full,]
validate_data_all <- all_data_all[-train_index_full,]
train_classes_all <- all_classes_all[train_index_full,]
validate_classes_all <- all_classes_all[-train_index_full,]



# drop not important attributes
train_data_all <- subset(train_data_all, select = c(important_attributes[,2]))
validate_data_all<-subset(validate_data_all, select = c(important_attributes[,2]))
#Data_binding
train_all_all <- cbind(train_data_all,train_classes_all);
validate_all_all<-cbind(validate_data_all,validate_classes_all)
colnames(train_all_all)[which(names(train_all_all) == "train_classes_all")] <- "Class"
colnames(validate_all_all)[which(names(validate_all_all) == "validate_classes_all")] <- "Class"

source("naiveBayes_all_classification.R")
set.seed(1234)
naiveBayes_all_classification(train_all_all, validate_all_all)


set.seed(1234)
random_data_full<-RandomForest_classification(train_all_all,validate_all_all)


source("plotting_nbc_randomforest.R")
