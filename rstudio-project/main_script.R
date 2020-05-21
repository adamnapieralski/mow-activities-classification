library(Boruta)
library(caret)

set.seed(17)

training_data <- read.table("../../HAPT Data Set/Train/X_train.txt", header = FALSE, sep = " ")
testing_data <- read.table("../../HAPT Data Set/Test/X_test.txt", header = FALSE, sep = " ")
training_class <- read.table("../../HAPT Data Set/Train/y_train.txt", header = FALSE, sep = " ")
testing_class <- read.table("../../HAPT Data Set/Test/y_test.txt", header = FALSE, sep = " ")

all_class = rbind(training_class, testing_class)
all_data = rbind(training_data, testing_data)
colnames(all_class) <- c("Class")
all_data_class = all_data
all_data_class <-cbind(all_data, all_class)

### tu usuniecie wierszy z klasami przejsciowymi


###

### tu podzial na zbior testowo/treningowy i walidacyjny (4:1)

# trainIndex = createDataPartition(all_data_class, p=.8, list=FALSE, times=1)
# train_data_class <- all_data_class[trainIndex,]
# test_data_class <- all_data_class[-trainIndex,]
###

length(all_class[,1])
  
value <- training_class[2,1]
print(value)
typeof(value)
number_of_examples<-0L

for (item in all_class[,1])
{
  if(item>=1 & item<=6 ) number_of_examples=number_of_examples+1
}
print(number_of_examples)

colnames(training_class) <- c("Class")
training_all = training_data
training_all <- cbind(training_data, training_class)


# data(iris)
# irisE<-cbind(setNames(data.frame(apply(iris[,-5],2,sample)), sprintf("Nonsense%d",1:4)), iris)
  
# long run - 1h25
# Boruta(Class~.,data=training_all, maxRuns=25, doTrace=2)->BorutaOnTraining
# BorutaOnTraining
# 4h15
# Boruta(Class~.,data=training_all, maxRuns=100, doTrace=2)->BorutaOnTraining100
# BorutaOnTraining100
