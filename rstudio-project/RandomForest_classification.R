RandomForest_classification <-function(train_data_and_classes, validate_data_and_classes) {
  
  random_data.learning <<- list()
  random_data.preds <<- list()
  random_data.preds.probs <<- list()
  random_data.preds.class <<- list()
  random_data.cm <<- list()
  random_data.mroc <<-list()
  
  train_data_and_classes_f <- train_data_and_classes
  train_data_and_classes_f$Class <- factor(train_data_and_classes_f$Class)
  validate_data_and_classes$Class <- factor(validate_data_and_classes$Class)
  # for k-cross validation
  n <- nrow(train_data_and_classes)
  K <- 5
  tail <- n%/%K
  alea <- runif(n)
  rn <- rank(alea)
  bloc <- as.factor((rn - 1)%/%tail + 1)
  
  random_data.err <<- list()
  shift<-list(0,10,20)
  
  for(var in 1:3){
    current=as.numeric(shift[var])
    if(var==1){
      number_of_trees=250
    }else if (var==2){
      number_of_trees=500
    }else{
      number_of_trees=1000
    }
    
    for (k in 1:K) {
      random_data.learning[[k+current]] <- randomForest(Class~., data=train_data_and_classes_f[bloc != k,], ntree=number_of_trees)
      random_data.preds.class[[k+current]] <- predict(random_data.learning[[current+k]], train_data_and_classes_f[bloc==k,], type="response")
      random_data.preds.probs[[k+current]] <- predict(random_data.learning[[current+k]], train_data_and_classes_f[bloc==k,], type="prob")
      random_data.cm[[k+current]] <- confusionMatrix(random_data.preds.class[[k+current]], train_data_and_classes_f[bloc==k,]$Class)
      random_data.err[[k+current]] <- random_data.cm[[current+k]][["overall"]][["Accuracy"]]
      # random_data.mroc[[k+current]] <- multiclass.roc(validate_data_and_classes[bloc==k,]$Class, random_data_reduced.preds.probs[[current+k]])
    }
    
    
    random_data.learning[[6+current]] <-random_data.learning[[match(max(unlist(random_data.err[current:(current+5)])), random_data.err)]]
    random_data.preds.class[[6+current]] <- predict(random_data.learning[[current+6]], newdata=subset(validate_data_and_classes, , -c(Class)), type="response")
    random_data.preds.probs[[6+current]] <- predict(random_data.learning[[current+6]],newdata=subset(validate_data_and_classes, , -c(Class)), type="prob")
    random_data.cm[[6+current]] <- confusionMatrix(random_data.preds.class[[6+current]], validate_data_and_classes$Class)
    random_data.err[[6+current]] <- random_data.cm[[current+6]][["overall"]][["Accuracy"]]
    random_data.mroc[[6+current]] <- multiclass.roc(validate_data_and_classes$Class, random_data.preds.probs[[current+6]])
    
    
  }
  
  random_data <- list(list("classifiers"=random_data.learning, "preds"=list("class"=random_data.preds.class, "probs"=random_data.preds.probs),
                           "cm"=random_data.cm, "err"=random_data.err, "mroc"=random_data.mroc))
  return(random_data)
  
  
}
