library(caret)
library(Boruta)

remove(list=ls())
source("preprocessing_data.R")
source("preprocessing_class.R")

all_data<-load_and_preprocess_data()
all_classes<-load_and_preprocess_classes()
all_data_and_classes <-cbind(all_data, all_classes)

trainIndex = createDataPartition(all_data_and_classes$Class, p=.8, list=FALSE, times=1)
train_data_and_classes <- all_data_and_classes[trainIndex,]
validate_data_and_classes <- all_data_and_classes[-trainIndex,]
