tree_classification <-function(train_data_and_classes, validate_data_and_classes) {
  tree_data.classifiers <<- list()
  tree_data.preds <<- list()
  tree_data.preds.probs <<- list()
  tree_data.preds.class <<- list()
  tree_data.cm <<- list()
  tree_data.mroc <<-list()
  
  train_data_and_classes_f <- train_data_and_classes
  train_data_and_classes_f$Class <- factor(train_data_and_classes_f$Class)
  tree_data.classifiers[[1]] <<- rpart(Class~., data=train_data_and_classes_f)
  
  tree_data.preds.probs[[1]] <<- predict(tree_data.classifiers[[1]], subset(validate_data_and_classes, , -c(Class)))
  tree_data.preds.class[[1]] <<- predict(tree_data.classifiers[[1]], subset(validate_data_and_classes, , -c(Class)), type="class")
  
  
  tree_data.cm[[1]] <<- confusionMatrix(tree_data.preds.class[[1]], as.factor(validate_data_and_classes$Class))
  tree_data.mroc[[1]] <<- multiclass.roc(validate_data_and_classes$Class, tree_data.preds.probs[[1]])
  
}