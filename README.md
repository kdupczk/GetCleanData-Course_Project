# GetCleanData-Course_Project
##The run_analysis.R script does the following:  
1. Loads the dplyr library.  
2. Reads in the following files:  
  + x\_train, y\_train and subject_train from the train folder.  
  + x\_test, y\_test and subject_test from the test folder.  
  + activity_labels and features from the main folder.    
3. The x\_train and x\_test data frames are created.    
  + the features file is used to create the header.  
  + the column with the variable names is extracted from the features file.  
  + punctuation marks and double words (e.g., BodyBody) are removed from features file.  
  + header add to x\_test and x\_train.  
4. The subject\_train and subject\_test files are used to create the id numbers.  
5. The y\_train and y\_test files are used to create the activity columns.  
6. The activity\_labels file is used to replace the numbers in the acitivty column with the activity name (e.g., all 1's are replaced by "Walking") in the y\_train and y\_test files.  
7. The id numbers and activities are then column-bound with the x\_train and x\_test files.  
8. The desired columns (id, activity and all mean and std columns) for x\_train and x\_test are extracted with the select option from dplyr.
9. The x\_train and x\_test files are row-bound together.  
10. The final\_table tab-delimited file is created using the group\_by command from dplyr to sort by id and then activity, and then the summarise\_all from dplyr is applied to get the means of all columns. 

##Files not mentioned above
+ The features\_info and README.txt files are from the original data set. They provide excellent information on the variables and how the tests were conducted. The features\_info was used to create the codebook.md file.  
+ The codebook.md provides information about the variables. Only the variables used in the course project are in codebook.md.