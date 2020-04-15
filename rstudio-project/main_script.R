remove(list=ls())
training_data <- read.table("../../HAPT Data Set/Train/X_train.txt", header = FALSE, sep = " ")
test_data <- read.table("../../HAPT Data Set/Test/X_test.txt", header = FALSE, sep = " ")
training_class <- read.table("../../HAPT Data Set/Train/y_train.txt", header = FALSE, sep = " ")
test_class <- read.table("../../HAPT Data Set/Test/y_test.txt", header = FALSE, sep = " ")
value <- training_class[2,1]
print(value)
typeof(value)
number_of_examples<-0L

all_class = rbind(training_class,test_class)
length(all_class[,1])
for (item in all_class[,1])
{
  if(item>=1 & item <=6) number_of_examples=number_of_examples+1
}
print(number_of_examples)
