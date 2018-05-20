rm(list = ls())

path_raw_data <- "C:/Users/Marius/Kaggle/HomeCreditDefaultRisk/01_Data/Raw"
path_target   <- "C:/Users/Marius/Kaggle/HomeCreditDefaultRisk/01_Data/Unzipped"
zip_files     <- c("application_test.csv.zip", 
                   "application_train.csv.zip", 
                   "bureau.csv.zip", 
                   "bureau_balance.csv.zip", 
                   "credit_card_balance.csv.zip", 
                   "installments_payments.csv.zip", 
                   "POS_CASH_balance.csv.zip", 
                   "previous_application.csv.zip", 
                   "sample_submission.csv.zip")

invisible(lapply(zip_files, 
                 function(x) unzip(file.path(path_raw_data, x), exdir = path_target)))