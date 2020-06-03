colors = c("red", "green", "blue", "purple")

# bayes

plot(bayes_data_reduced.mroc[[6]][["rocs"]][["4/5"]][[1]], col=colors[[1]], main="ROC dla naiwnego klasyfikatora Bayesa, klas 4 vs. 5 z klas nieprzejściowych", cex.main=0.65)
lines(bayes_data_reduced.mroc[[6]][["rocs"]][["4/5"]][[2]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("4/5 (AUC=", round(auc(bayes_data_reduced.mroc[[6]][["rocs"]][["4/5"]][[1]]), 3), ")"),
                  paste("5/4 (AUC=", round(auc(bayes_data_reduced.mroc[[6]][["rocs"]][["4/5"]][[2]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19), 
       bty = "n", 
       pt.cex = 0.8, 
       cex = 0.8,
       y.intersp=2,
       text.col = "black", 
       horiz = F , 
       inset = c(0.25, 0.1))

plot(bayes_data_all.mroc[[6]][["rocs"]][["4/5"]][[1]], col=colors[[1]], main="ROC dla naiwnego klasyfikatora Bayesa, klas 4 vs. 5 z wszytkich klas", cex.main=0.65)
lines(bayes_data_all.mroc[[6]][["rocs"]][["4/5"]][[2]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("4/5 (AUC=", round(auc(bayes_data_all.mroc[[6]][["rocs"]][["4/5"]][[1]]), 3), ")"),
                  paste("5/4 (AUC=", round(auc(bayes_data_all.mroc[[6]][["rocs"]][["4/5"]][[2]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19), 
       bty = "n", 
       pt.cex = 0.8, 
       cex = 0.8, 
       y.intersp=2,
       text.col = "black", 
       horiz = F , 
       inset = c(0.25, 0.1))


plot(bayes_data_all.mroc[[6]][["rocs"]][["9/11"]][[1]], col=colors[[1]],  main="ROC dla naiwnego klasyfikatora Bayesa, klas 9 vs. 11 z wszystkich klas", cex.main=0.7)
lines(bayes_data_all.mroc[[6]][["rocs"]][["9/11"]][[2]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("9/11 (AUC=", round(auc(bayes_data_all.mroc[[6]][["rocs"]][["9/11"]][[1]]), 3), ")"),
                  paste("11/9 (AUC=", round(auc(bayes_data_all.mroc[[6]][["rocs"]][["9/11"]][[2]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19),
       bty = "n",
       pt.cex = 0.8,
       cex = 0.8,
       y.intersp=2,
       text.col = "black",
       horiz = F ,
       inset = c(0.25, 0.1))

plot(bayes_data_all.mroc[[6]][["rocs"]][["4/11"]][[1]], col=colors[[1]],  main="ROC dla naiwnego klasyfikatora Bayesa, klas 4 vs. 11 z wszystkich klas", cex.main=0.65)
lines(bayes_data_all.mroc[[6]][["rocs"]][["4/11"]][[2]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("4/11 (AUC=", round(auc(bayes_data_all.mroc[[6]][["rocs"]][["4/11"]][[1]]), 3), ")"),
                  paste("11/4 (AUC=", round(auc(bayes_data_all.mroc[[6]][["rocs"]][["4/11"]][[2]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19),
       bty = "n",
       pt.cex = 0.8,
       cex = 0.8,
       y.intersp=2,
       text.col = "black",
       horiz = F ,
       inset = c(0.25, 0.1))

plot(random_data_reduced[[1]][["mroc"]][[6]][["rocs"]][["4/5"]][[1]], col=colors[[1]], main="ROC dla lasu losowego, klas 4 vs. 5 z klas nieprzejściowych", cex.main=0.7)
lines(random_data_reduced[[1]][["mroc"]][[6]][["rocs"]][["4/5"]][[2]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("4/5 (AUC=", round(auc(random_data_reduced[[1]][["mroc"]][[6]][["rocs"]][["4/5"]][[1]]), 3), ")"),
                  paste("4/5 (AUC=", round(auc(random_data_reduced[[1]][["mroc"]][[6]][["rocs"]][["4/5"]][[2]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19),
       bty = "n",
       pt.cex = 0.8,
       cex = 0.8,
       y.intersp=2,
       text.col = "black",
       horiz = F ,
       inset = c(0.25, 0.1))

plot(random_data_full[[1]][["mroc"]][[6]][["rocs"]][["4/5"]][[1]], col=colors[[1]], main="ROC dla lasu losowego, klas 4 vs. 5 z wszystkich klas", cex.main=0.7)
lines(random_data_full[[1]][["mroc"]][[6]][["rocs"]][["4/5"]][[2]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("4/5 (AUC=", round(auc(random_data_full[[1]][["mroc"]][[6]][["rocs"]][["4/5"]][[1]]), 3), ")"),
                  paste("4/5 (AUC=", round(auc(random_data_full[[1]][["mroc"]][[6]][["rocs"]][["4/5"]][[2]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19),
       bty = "n",
       pt.cex = 0.8,
       cex = 0.8,
       y.intersp=2,
       text.col = "black",
       horiz = F ,
       inset = c(0.25, 0.1))


plot(random_data_full[[1]][["mroc"]][[6]][["rocs"]][["9/11"]][[1]], col=colors[[1]], main="ROC dla lasu losowego, klas 9 vs. 11 z wszystkich klas", cex.main=0.7)
lines(random_data_full[[1]][["mroc"]][[6]][["rocs"]][["9/11"]][[2]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("9/11 (AUC=", round(auc(random_data_full[[1]][["mroc"]][[6]][["rocs"]][["9/11"]][[1]]), 3), ")"),
                  paste("9/11 (AUC=", round(auc(random_data_full[[1]][["mroc"]][[6]][["rocs"]][["9/11"]][[2]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19),
       bty = "n",
       pt.cex = 0.8,
       cex = 0.8,
       y.intersp=2,
       text.col = "black",
       horiz = F ,
       inset = c(0.25, 0.1))

plot(random_data_full[[1]][["mroc"]][[6]][["rocs"]][["4/11"]][[1]], col=colors[[1]], main="ROC dla lasu losowego, klas 4 vs. 11 z wszystkich klas", cex.main=0.7)
lines(random_data_full[[1]][["mroc"]][[6]][["rocs"]][["4/11"]][[2]], col=colors[[2]])
legend("bottomright",
       legend = c(paste("4/11 (AUC=", round(auc(random_data_full[[1]][["mroc"]][[6]][["rocs"]][["4/11"]][[1]]), 3), ")"),
                  paste("4/11 (AUC=", round(auc(random_data_full[[1]][["mroc"]][[6]][["rocs"]][["4/11"]][[2]]), 3), ")")),
       col = colors[1:2],
       pch = c(17,19),
       bty = "n",
       pt.cex = 0.8,
       cex = 0.8,
       y.intersp=2,
       text.col = "black",
       horiz = F ,
       inset = c(0.25, 0.1))
