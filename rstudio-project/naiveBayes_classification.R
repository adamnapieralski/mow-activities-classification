naiveBayes_classification <-function(train_data_and_classes, validate_data_and_classes) {
  
  bayes_data.model <<- list()
  bayes_data.preds <<- list()
  bayes_data.preds.raw <<- list()
  bayes_data.preds.class <<- list()
  bayes_data.cm <<- list()
  bayes_data.mroc <<-list()
  
  
  train_data_and_classes_f <- train_data_and_classes
  train_data_and_classes_f$Class <- factor(train_data_and_classes_f$Class)
  
  # for k-cross validation
  n <- nrow(train_data_and_classes)
  K <- 5
  tail <- n%/%K
  alea <- runif(n)
  rn <- rank(alea)
  bloc <- as.factor((rn - 1)%/%tail + 1)
  
  bayes_data.err <<- list()
  
  for (k in 1:K) {
    set.seed(1234)
    bayes_data.model[[k]] <<- naiveBayes(Class~.,data=train_data_and_classes_f[bloc != k,], laplace = 0)
    bayes_data.preds.class[[k]] <<-predict(bayes_data.model[[k]], newdata=train_data_and_classes_f[bloc==k,], type="class")
    bayes_data.preds.raw[[k]] <<- predict(bayes_data.model[[k]], newdata=train_data_and_classes_f[bloc==k,], type="raw")
    bayes_data.cm[[k]] <<- confusionMatrix(bayes_data.preds.class[[k]], train_data_and_classes_f[bloc==k,]$Class)
    bayes_data.err[[k]] <<- bayes_data.cm[[k]][["overall"]][["Accuracy"]]
    bayes_data.mroc[[k]] <<- multiclass.roc(validate_data_and_classes[bloc==k,]$Class, bayes_data.preds.raw[[k]])
  }
  
  
  #train_data_and_classes$Class <- factor(train_all$Class)
  #nb_model= naiveBayes(Class~.,data=train_data_and_classes, laplace = 0)
  #modelPred <- predict(nb_model, newdata=validate_data_and_classes, type="class")
  #cMatrix <- table(modelPred, validate_data_and_classes$Class)
  #confusionMatrix(cMatrix)
}
