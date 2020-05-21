  load_and_preprocess_data <-function(){
  remove(list=ls())
  training_data <- read.table("../../HAPT Data Set/Train/X_train.txt", header = FALSE, sep = " ")
  test_data <- read.table("../../HAPT Data Set/Test/X_test.txt", header = FALSE, sep = " ")
  training_class <- read.table("../../HAPT Data Set/Train/y_train.txt", header = FALSE, sep = " ")
  test_class <- read.table("../../HAPT Data Set/Test/y_test.txt", header = FALSE, sep = " ")
  all_classes = rbind(training_class,test_class)
  all_data=rbind(training_data,test_data)
  all_data<-data.frame(all_data)
  all_classes<-data.frame(all_classes)
  
  reduced<-all_data[which(all_classes$V1<7), ]
  return(reduced)
  }

