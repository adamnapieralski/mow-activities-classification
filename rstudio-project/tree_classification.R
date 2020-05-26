tree_classification <-function(train_data_and_classes, validate_data_and_classes) {
  tree_data.classifiers <<- list()
  tree_data.preds <<- list()
  tree_data.preds.probs <<- list()
  tree_data.preds.class <<- list()
  tree_data.cm <<- list()
  tree_data.mroc <<-list()
  
  train_data_and_classes_f <- train_data_and_classes
  train_data_and_classes_f$Class <- factor(train_data_and_classes_f$Class)
  
  # for k-cross validation
  n <- nrow(train_data_and_classes)
  K <- 5
  tail <- n%/%K
  alea <- runif(n)
  rn <- rank(alea)
  bloc <- as.factor((rn - 1)%/%tail + 1)

  tree_data.err <<- list()
  
  for (k in 1:K) {
    tree_data.classifiers[[k]] <<- rpart(Class~., data=train_data_and_classes_f[bloc != k,])
    tree_data.preds.class[[k]] <<- predict(tree_data.classifiers[[k]], train_data_and_classes_f[bloc==k,], type="class")
    tree_data.preds.probs[[k]] <<- predict(tree_data.classifiers[[k]], train_data_and_classes_f[bloc==k,])
    tree_data.cm[[k]] <<- confusionMatrix(tree_data.preds.class[[k]], train_data_and_classes_f[bloc==k,]$Class)
    tree_data.err[[k]] <<- tree_data.cm[[k]][["overall"]][["Accuracy"]]
    tree_data.mroc[[k]] <<- multiclass.roc(validate_data_and_classes[bloc==k,]$Class, tree_data.preds.probs[[k]])
  }
  
  #tree_data.preds.probs[[1]] <<- predict(tree_data.classifiers[[1]], subset(validate_data_and_classes, , -c(Class)))
  #tree_data.preds.class[[1]] <<- predict(tree_data.classifiers[[1]], subset(validate_data_and_classes, , -c(Class)), type="class")
  
  
  #tree_data.cm[[1]] <<- confusionMatrix(tree_data.preds.class[[1]], as.factor(validate_data_and_classes$Class))
  #tree_data.mroc[[1]] <<- multiclass.roc(validate_data_and_classes$Class, tree_data.preds.probs[[1]])
  
}