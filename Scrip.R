## download function
downloadcsv <- function(url, nastrings) {
      temp <- tempfile()
      download.file(url, temp, method = "curl")
      data <- read.csv(temp, na.strings = nastrings)
      unlink(temp)
      return(data)
}

## training data
trainurl <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"

train <- downloadcsv(trainurl, c("", "NA", "#DIV/0!"))

dim(train)

table(train$classe)

## test data
testurl <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"

test <- downloadcsv(testurl, c("", "NA", "#DIV/0!"))

## Preprocess data - Partitioning  
library(caret)

set.seed(123456)

trainset <- createDataPartition(train$classe, p = 0.8, list = FALSE)

Training <- train[trainset, ]

Validation <- train[-trainset, ]

## Select features
nzvcol <- nearZeroVar(Training)

Training <- Training[, -nzvcol]

## Clean data containing missing values
cntlength <- sapply(Training, function(x) {
      sum(!(is.na(x) | x == ""))
})

nullcol <- names(cntlength[cntlength < 0.6 * length(Training$classe)])

descriptcol <- c("X", "user_name", "raw_timestamp_part_1", "raw_timestamp_part_2", "cvtd_timestamp", "new_window", "num_window")

excludecols <- c(descriptcol, nullcol)

## Time for Training :)
Training <- Training[, !names(Training) %in% excludecols]> library(randomForest)

rfModel <- randomForest(as.factor(classe) ~ ., data = Training, importance = TRUE, ntrees = 10)

## Validation
ptraining <- predict(rfModel, Training)

print(confusionMatrix(table(ptraining, Training$classe)))

pvalidation <- predict(rfModel, Validation)

print(confusionMatrix(table(pvalidation, Validation$classe)))

## Test data prediction
ptest <- predict(rfModel, test)

ptest
