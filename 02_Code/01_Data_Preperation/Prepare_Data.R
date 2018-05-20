rm(list = ls())

library(data.table)

# Path to unzipped CSV-files
path_data   <- "C:/Users/Marius/Kaggle/HomeCreditDefaultRisk/01_Data/Unzipped"

# The files 'application_test.csv' and 'sample_submission.csv' are not loaded
# because they are not relevant for model building
data_files  <- c("application_train.csv", 
                  "bureau.csv", 
                  "bureau_balance.csv", 
                  "credit_card_balance.csv", 
                  "installments_payments.csv", 
                  "POS_CASH_balance.csv", 
                  "previous_application.csv")

# Files won't be read at once to keep RAM usage low
appl_train   <- data.table::fread(input = file.path(path_data, 
                                                    "application_train.csv"))


param <-  data.frame(nrounds=c(100), max_depth = c(2),eta =c(0.3),gamma=c(0),
                     colsample_bytree=c(0.8),min_child_weight=c(1),subsample=c(1))                           

#xgboost
set.seed(1992)
fit.xgb <- xgb.train(
  params = list(eta = param$eta, max_depth = param$max_depth, 
                gamma = param$gamma, colsample_bytree = param$colsample_bytree, 
                min_child_weight = param$min_child_weight, subsample = param$subsample),   
  data = xgb.trainData, nrounds = param$nrounds, objective = "binary:logistic")

#caret
set.seed(1992)
fit.xgbTree <- train(Class~., data=trainSet, method="xgbTree",
                     metric="Accuracy", trControl=trainControl(method="none"),tuneGrid=param)


