library(caret)
library(Boruta)

remove(list=ls())
source("preprocessing_data.R")
source("preprocessing_class.R")

all_data<-load_and_preprocess_data()
all_classes<-load_and_preprocess_classes()

# bind data with classes
all_data_and_classes <-cbind(all_data, all_classes)

# partition data 1:4
train_index = createDataPartition(all_data_and_classes$Class, p=.8, list=FALSE, times=1)
train_data_and_classes <- all_data_and_classes[train_index,]
validate_data_and_classes <- all_data_and_classes[-train_index,]

train_data <- all_data[train_index,]
validate_data <- all_data[-train_index,]
train_classes <- all_classes[trainIndex,]
validate_classes <- all_classes[-train_index,]


# long 7h run...
# BorutaOnTraining250 <- Boruta(Class~.,data=train_data_and_classes, maxRuns=250, doTrace=2)

# load only important attibutes selected by Boruta
important_attributes <- read.csv("boruta_out/boruta_250_important_tentative.csv")
# drop not important attributes
train_data <- subset(train_data, select = c(important_attributes[,2]))
