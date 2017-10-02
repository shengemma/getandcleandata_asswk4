Data load

The Features, Actitivy, and Train data is loaded from each of the training and test datasets, directly as their final type.
Only the columns of interest from Features are loaded, that is the mean() and sd() columns. 
I determine the columns by examining the feature names (from features.txt) for patterns “-mean()” or “-std()”.
All of these files are fixed format text files.

Transformation
Extracts only the measurements on the mean and standard deviation for each measurement.
Get the mean and standard deviation by using grep function. 
subset the original data set with the mean and standard deviation when we loaded in the previous step.

Named all the data by using: start with "^" and set the criterias to find certain words as column's names. 
Then appended them all into the "data" from previous step.

Wrote the table by using write.table function. 
R created a workspace file. 


