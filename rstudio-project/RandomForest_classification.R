RandomForest_classification <-function(train_data_and_classes, validate_data_and_classes) {
  set.seed(1234)
  
  random_data.learning <<- list()
  random_data.preds <<- list()
  random_data.preds.probs <<- list()
  random_data.preds.class <<- list()
  random_data.cm <<- list()
  random_data.mroc <<-list()
  
  train_data_and_classes_f <- train_data_and_classes
  train_data_and_classes_f$Class <- factor(train_data_and_classes_f$Class)
  
  # for k-cross validation
  n <- nrow(train_data_and_classes)
  K <- 5
  tail <- n%/%K
  alea <- runif(n)
  rn <- rank(alea)
  bloc <- as.factor((rn - 1)%/%tail + 1)
  
  random_data.err <<- list()
  
  for (k in 1:K) {
    random_data.learning[[k]] <<- randomForest(Class~., data=train_data_and_classes_f[bloc != k,], ntree=100, proximity=T)
    random_data.preds.class[[k]] <<- predict(random_data.learning[[k]], train_data_and_classes_f[bloc==k,], type="response")
    random_data.preds.probs[[k]] <<- predict(random_data.learning[[k]], train_data_and_classes_f[bloc==k,], type="prob")
    random_data.cm[[k]] <<- confusionMatrix(random_data.preds.class[[k]], train_data_and_classes_f[bloc==k,]$Class)
    random_data.err[[k]] <<- random_data.cm[[k]][["overall"]][["Accuracy"]]
    random_data.mroc[[k]] <<- multiclass.roc(validate_data_and_classes[bloc==k,]$Class, random_data.preds.probs[[k]])
  }
  
  #train_data_and_classes$Class<-factor(train_data_and_classes$Class)
  #learning_tree= randomForest(Class~., data=train_data_and_classes, ntree=100, proximity=T)
  #table(predict(learning_tree), train_all$Class)
  #learning_tree
  #plot(learning_tree)
  #importance(learning_tree)
  
  #prediction = predict(learning_tree, validate_data_and_classes, type="response")
  #CM = table(prediction, validate_data_and_classes$Class)
  #accuracy=(sum(diag(CM)))/sum(CM)
  #confusionMatrix(CM)
}
