colors = c("red", "green", "blue", "purple")

# tree

plot(tree_data_reduced_classes[["validate"]][["mroc"]][["rocs"]][["4/5"]][[1]], col=colors[[1]], main="ROC dla drzew decyzyjnych, klas 4 vs. 5 z klas nieprzejściowych", cex.main=0.7)
lines(tree_data_reduced_classes[["validate"]][["mroc"]][["rocs"]][["4/5"]][[2]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("4/5 (AUC=", round(auc(tree_data_reduced_classes[["validate"]][["mroc"]][["rocs"]][["4/5"]][[1]]), 3), ")"),
                  paste("5/4 (AUC=", round(auc(tree_data_reduced_classes[["validate"]][["mroc"]][["rocs"]][["4/5"]][[2]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19), 
       bty = "n", 
       pt.cex = 0.8, 
       cex = 0.7, 
       text.col = "black", 
       horiz = F , 
       inset = c(0.1, 0.1))

plot(tree_data_all_classes[["validate"]][["mroc"]][["rocs"]][["9/11"]][[1]], col=colors[[1]],  main="ROC dla drzew decyzyjnych, klas 9 vs. 11 z wszystkich klas", cex.main=0.7)
lines(tree_data_all_classes[["validate"]][["mroc"]][["rocs"]][["9/11"]][[2]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("9/11 (AUC=", round(auc(tree_data_all_classes[["validate"]][["mroc"]][["rocs"]][["9/11"]][[1]]), 3), ")"),
                  paste("11/9 (AUC=", round(auc(tree_data_all_classes[["validate"]][["mroc"]][["rocs"]][["9/11"]][[2]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19), 
       bty = "n", 
       pt.cex = 0.8, 
       cex = 0.7, 
       text.col = "black", 
       horiz = F , 
       inset = c(0.1, 0.1))

plot(tree_data_all_classes[["validate"]][["mroc"]][["rocs"]][["4/11"]][[1]], col=colors[[1]],  main="ROC dla drzew decyzyjnych, klas 4 vs. 11 z wszystkich klas", cex.main=0.7)
lines(tree_data_all_classes[["validate"]][["mroc"]][["rocs"]][["4/11"]][[2]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("4/11 (AUC=", round(auc(tree_data_all_classes[["validate"]][["mroc"]][["rocs"]][["4/11"]][[1]]), 3), ")"),
                  paste("11/4 (AUC=", round(auc(tree_data_all_classes[["validate"]][["mroc"]][["rocs"]][["4/11"]][[2]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19), 
       bty = "n", 
       pt.cex = 0.8, 
       cex = 0.7, 
       text.col = "black", 
       horiz = F , 
       inset = c(0.1, 0.1))

plot(svm_data_reduced_classes[["radial"]][["mroc"]][[2]][["rocs"]][["1/2"]][[1]], col=colors[[1]], main="ROC dla SVM, f. radialnej, klas 1 vs. 2 z klas nieprzejściowych", cex.main=0.7)
lines(svm_data_reduced_classes[["radial"]][["mroc"]][[2]][["rocs"]][["1/2"]][[2]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("1/2 (AUC=", round(auc(svm_data_reduced_classes[["radial"]][["mroc"]][[2]][["rocs"]][["1/2"]][[1]]), 3), ")"),
                  paste("1/2 (AUC=", round(auc(svm_data_reduced_classes[["radial"]][["mroc"]][[2]][["rocs"]][["1/2"]][[2]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19), 
       bty = "n", 
       pt.cex = 0.8, 
       cex = 0.7, 
       text.col = "black", 
       horiz = F , 
       inset = c(0.1, 0.1))

plot(svm_data_reduced_classes[["radial"]][["mroc"]][[2]][["rocs"]][["5/4"]][[2]], col=colors[[1]], main="ROC dla SVM, f. radialnej, klas 4 vs. 5 z klas nieprzejściowych", cex.main=0.7)
lines(svm_data_reduced_classes[["radial"]][["mroc"]][[2]][["rocs"]][["5/4"]][[1]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("4/5 (AUC=", round(auc(svm_data_reduced_classes[["radial"]][["mroc"]][[2]][["rocs"]][["5/4"]][[2]]), 3), ")"),
                  paste("5/4 (AUC=", round(auc(svm_data_reduced_classes[["radial"]][["mroc"]][[2]][["rocs"]][["5/4"]][[1]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19), 
       bty = "n", 
       pt.cex = 0.8, 
       cex = 0.7, 
       text.col = "black", 
       horiz = F , 
       inset = c(0.1, 0.1))

plot(svm_data_all_classes[["radial"]][["mroc"]][[2]][["rocs"]][["11/9"]][[2]], col=colors[[1]], main="ROC dla SVM, f. radialnej, klas 9 vs. 11 z wszystkich klas", cex.main=0.7)
lines(svm_data_all_classes[["radial"]][["mroc"]][[2]][["rocs"]][["11/9"]][[1]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("9/11 (AUC=", round(auc(svm_data_all_classes[["radial"]][["mroc"]][[2]][["rocs"]][["11/9"]][[2]]), 3), ")"),
                  paste("11/9 (AUC=", round(auc(svm_data_all_classes[["radial"]][["mroc"]][[2]][["rocs"]][["11/9"]][[1]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19), 
       bty = "n", 
       pt.cex = 0.8, 
       cex = 0.7, 
       text.col = "black", 
       horiz = F , 
       inset = c(0.1, 0.1))

plot(svm_data_all_classes[["radial"]][["mroc"]][[2]][["rocs"]][["4/11"]][[1]], col=colors[[1]], main="ROC dla SVM, f. radialnej, klas 4 vs. 11 z wszystkich klas", cex.main=0.7)
lines(svm_data_all_classes[["radial"]][["mroc"]][[2]][["rocs"]][["4/11"]][[2]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("4/11 (AUC=", round(auc(svm_data_all_classes[["radial"]][["mroc"]][[2]][["rocs"]][["4/11"]][[1]]), 3), ")"),
                  paste("11/4 (AUC=", round(auc(svm_data_all_classes[["radial"]][["mroc"]][[2]][["rocs"]][["4/11"]][[2]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19), 
       bty = "n", 
       pt.cex = 0.8, 
       cex = 0.7, 
       text.col = "black", 
       horiz = F , 
       inset = c(0.1, 0.1))

plot(svm_data_reduced_classes[["linear"]][["mroc"]][["rocs"]][["5/4"]][[2]], col=colors[[1]], main="ROC dla SVM, f. liniowej, klas 4 vs. 5 z klas nieprzejściowych", cex.main=0.7)
lines(svm_data_reduced_classes[["linear"]][["mroc"]][["rocs"]][["5/4"]][[1]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("4/5 (AUC=", round(auc(svm_data_reduced_classes[["linear"]][["mroc"]][["rocs"]][["5/4"]][[2]]), 3), ")"),
                  paste("5/4 (AUC=", round(auc(svm_data_reduced_classes[["linear"]][["mroc"]][["rocs"]][["5/4"]][[1]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19), 
       bty = "n", 
       pt.cex = 0.8, 
       cex = 0.7, 
       text.col = "black", 
       horiz = F , 
       inset = c(0.1, 0.1))

plot(svm_data_all_classes[["linear"]][["mroc"]][["rocs"]][["11/9"]][[2]], col=colors[[1]], main="ROC dla SVM, f. liniowej, klas 9 vs. 11 z wszystkich klas", cex.main=0.7)
lines(svm_data_all_classes[["linear"]][["mroc"]][["rocs"]][["11/9"]][[1]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("9/11 (AUC=", round(auc(svm_data_all_classes[["linear"]][["mroc"]][["rocs"]][["11/9"]][[2]]), 3), ")"),
                  paste("11/9 (AUC=", round(auc(svm_data_all_classes[["linear"]][["mroc"]][["rocs"]][["11/9"]][[1]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19), 
       bty = "n", 
       pt.cex = 0.8, 
       cex = 0.7, 
       text.col = "black", 
       horiz = F , 
       inset = c(0.1, 0.1))

plot(svm_data_all_classes[["linear"]][["mroc"]][["rocs"]][["4/11"]][[1]], col=colors[[1]], main="ROC dla SVM, f. liniowej, klas 4 vs. 11 z wszystkich klas", cex.main=0.7)
lines(svm_data_all_classes[["linear"]][["mroc"]][["rocs"]][["4/11"]][[2]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("4/11 (AUC=", round(auc(svm_data_all_classes[["linear"]][["mroc"]][["rocs"]][["4/11"]][[1]]), 3), ")"),
                  paste("11/4 (AUC=", round(auc(svm_data_all_classes[["linear"]][["mroc"]][["rocs"]][["4/11"]][[2]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19), 
       bty = "n", 
       pt.cex = 0.8, 
       cex = 0.7, 
       text.col = "black", 
       horiz = F , 
       inset = c(0.1, 0.1))
