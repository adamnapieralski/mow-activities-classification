naiveBayes_reduced_classification <-function(train_data_and_classes, validate_data_and_classes) {
  
  bayes_data_reduced.model <<- list()
  bayes_data_reduced.preds <<- list()
  bayes_data_reduced.preds.raw <<- list()
  bayes_data_reduced.preds.class <<- list()
  bayes_data_reduced.cm <<- list()
  bayes_data_reduced.mroc <<-list()
  
  
  train_data_and_classes_f <- train_data_and_classes
  train_data_and_classes_f$Class <- factor(train_data_and_classes_f$Class)
  
  # for k-cross validation
  n <- nrow(train_data_and_classes)
  K <- 5
  tail <- n%/%K
  alea <- runif(n)
  rn <- rank(alea)
  bloc <- as.factor((rn - 1)%/%tail + 1)
  
  bayes_data_reduced.err <<- list()
  for (k in 1:K) {
    
    bayes_data_reduced.model[[k]] <<- naiveBayes(Class~.,data=train_data_and_classes_f[bloc != k,], laplace = 0)
    bayes_data_reduced.preds.class[[k]] <<-predict(bayes_data_reduced.model[[k]], newdata=train_data_and_classes_f[bloc==k,], type="class")
    bayes_data_reduced.preds.raw[[k]] <<- predict(bayes_data_reduced.model[[k]], newdata=train_data_and_classes_f[bloc==k,], type="raw")
    bayes_data_reduced.cm[[k]] <<- confusionMatrix(bayes_data_reduced.preds.class[[k]], train_data_and_classes_f[bloc==k,]$Class)
    bayes_data_reduced.err[k] <<- bayes_data_reduced.cm[[k]][["overall"]][["Accuracy"]]
    bayes_data_reduced.mroc[[k]] <<- multiclass.roc(validate_data_and_classes[bloc==k,]$Class, bayes_data_reduced.preds.raw[[k]])
  }
  
  validate_data_and_classes$Class <- factor(validate_data_and_classes$Class)
  bayes_data_reduced.model[[6]] <<- naiveBayes(as.factor(Class)~.,data=train_data_and_classes, laplace = 0)
  bayes_data_reduced.preds.class[[6]] <<-predict(bayes_data_reduced.model[[6]], newdata=validate_data_and_classes, type="class")
  bayes_data_reduced.preds.raw[[6]] <<- predict(bayes_data_reduced.model[[6]], newdata=validate_data_and_classes, type="raw")
  bayes_data_reduced.cm[[6]] <<- confusionMatrix(bayes_data_reduced.preds.class[[6]], validate_data_and_classes$Class)
  bayes_data_reduced.err[6] <<- bayes_data_reduced.cm[[6]][["overall"]][["Accuracy"]]
  bayes_data_reduced.mroc[[6]] <<- multiclass.roc(validate_data_and_classes$Class, bayes_data_reduced.preds.raw[[6]])
  
  # bayes_data_reduced.model[[6]] <<- naiveBayes(Class~.,data=train_data_and_classes, laplace = 0)
  # bayes_data_reduced.preds.class[[6]] <<- predict(bayes_data_reduced.model[[6]], newdata=validate_data_and_classes, type="class")
  # cMatrix <- table(bayes_data_reduced.model[[6]], bayes_data_reduced.preds.class[[6]])
  # bayes_data_reduced.cm[[6]]<<-confusionMatrix(cMatrix)
}
