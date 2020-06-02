
load_and_preprocess_classes <- function(withAllClasses) {
  training_class <- read.table("../../HAPT Data Set/Train/y_train.txt", header = FALSE, sep = " ")
  test_class <- read.table("../../HAPT Data Set/Test/y_test.txt", header = FALSE, sep = " ")
  all_classes = rbind(training_class,test_class)
  all_classes <- data.frame(all_classes)
  
  colnames(all_classes) <- c("Class")
  
  if(isTRUE(withAllClasses)) {
    reduced<-all_classes
  }
  else {
    
    reduced <- subset(all_classes, Class < 7)
  }
  return(reduced)
}