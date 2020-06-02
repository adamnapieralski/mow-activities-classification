svm_classification <- function(train_data_and_classes, validate_data_and_classes) {
  gamma_default = 1 / (dim(train_data_and_classes)[2] - 1)
  gammas <- c(gamma_default / 3, gamma_default, 3 * gamma_default)
  svm_data.classifiers.radial <- list()
  svm_data.classifiers.linear <- list()
  svm_data.preds.radial <- list()
  svm_data.preds.linear <- list()
  svm_data.cm.radial <- list()
  svm_data.cm.linear <- list()
  svm_data.mroc.radial <- list()
  svm_data.mroc.linear <- list()
  
  
  for (var in 1:3) {
    print("SVM")
    print(var)
    svm_data.classifiers.radial[[var]] <- svm(formula = Class~., data=train_data_and_classes, type="C-classification", kernel="radial", gamma=gammas[[var]], probability=TRUE, cross=5, verbosity=3)
    #svm_data.classifiers.radial <<- c(svm_data.classifiers, list(svm_c))
    #y_pred <- predict(svm_c, newdata=subset(validate_data_and_classes, , -c(Class)), probability=TRUE)
    print("Predictions, CM, ROC")
    svm_data.preds.radial[[var]] <- predict(svm_data.classifiers.radial[[var]], newdata=subset(validate_data_and_classes, , -c(Class)), probability=TRUE)
    svm_data.cm.radial[[var]] <- confusionMatrix(svm_data.preds.radial[[var]], as.factor(validate_data_and_classes$Class))
    svm_data.mroc.radial[[var]] <- multiclass.roc(validate_data_and_classes$Class, attr(svm_data.preds.radial[[var]], "probabilities"))
  }
  print("SVM linear")
  #svm_c <- svm(formula = Class~., data=train_data_and_classes, type="C-classification", kernel="linear", probability=TRUE, cross=5)
  svm_data.classifiers.linear[[1]] <- svm(formula = Class~., data=train_data_and_classes, type="C-classification", kernel="linear", probability=TRUE, cross=5, verbosity=3)
  #y_pred <- predict(svm_c, newdata=subset(validate_data_and_classes, , -c(Class)), probability=TRUE)
  svm_data.preds.linear[[1]] <- predict(svm_data.classifiers.linear[[1]], newdata=subset(validate_data_and_classes, , -c(Class)), probability=TRUE)
      svm_data.cm.linear <- confusionMatrix(svm_data.preds.linear[[1]], as.factor(validate_data_and_classes$Class))
  svm_data.mroc.linear <- multiclass.roc(validate_data_and_classes$Class, attr(svm_data.preds.linear[[1]], "probabilities"))
  
  svm_data <- list("radial" = list("classifiers"=svm_data.classifiers.radial, "preds"=svm_data.preds.radial,
                                   "cm"=svm_data.cm.radial, "mroc"=svm_data.mroc.radial),
                   "linear" = list("classifiers"=svm_data.classifiers.linear, "preds"=svm_data.classifiers.linear,
                                   "cm"=svm_data.cm.linear, "mroc"=svm_data.mroc.linear))
  return(svm_data)
  #svmClassifier1 <- svm(formula = Class~., data=train_data_and_classes, type="C-classification", kernel="radial", probability=TRUE)
  #y_pred_prob = predict(svmClassifier1, newdata=subset(validate_data_and_classes, , -c(Class)), probability=TRUE)
  #mroc <- multiclass.roc(validate_data_and_classes$Class, pred["probabilities"])
  #cm = table(validate_classes[, 1], y_pred)
}