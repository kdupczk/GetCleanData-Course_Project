# GetCleanData-Course_Project
The run_analysis.R script does the following:  
1. Loads the dplyr library  
2. Reads in the following files:  
  +x_train, y_train and subject_train from the train folder  
  +x_test, y_test and subject_test from the test folder  
  +activity_labels from the main folder  
  +features from the main folder  
3. The x_train and x_test data frames are created    
  +the features file is used to create the header 
  +the column with the variable names is extracted from the features file  
  +punctuation marks are removed from features  
  +added as header to x_test and x_train  
4. The subject_train and subject_test files are used to create the id numbers  
5. The y_train and y_test files are used to create the activity columns  
6. The activity_labels file is used to replace the numbers in the acitivty column with the activity name (e.g., all 1's are replaced by "Walking") in the y_train and y_test files  
7. The id numbers and activities are then column-bound with the x_train and x_test files.  
8. The desired columns (id, activity and all mean and std columns) for x_train and x_test are extracted with the select option from dplyr
9. The x_train and x_test files are row-bound together
