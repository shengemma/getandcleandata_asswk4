Similar data are merged using rbind() function. e.g. Training and test data of x, y and sj(as for "Subject) are merged.

Columns with meaures MEAN and STANDARD DEVIATION are extracted from the dataset. 

Appropriate names are updated from features.txt file in the obtained dataset.

From the activity_labels.txt file, corresponding activites are updated in the dataset. (Available activites are: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

Independent tidy dataset with mean value for each subject and activity is generated. The output file is tidy_data_V2.txt to be different with version 1

##Description of Variables

X_test, Y_test, X_train, Y_trian, sj_test and sj_train contain the data from the downloaded files.
x, y and sj merge the previous datasets mentioned above.
features contains the file features.txt. 
ms contains all the columns having literal 'mean' or 'std'.
activities contains the file activity_labels.txt. 
Data merges x, y and sj into a single dataset. 

And finally, avg contains the corresponding averages which is finally stored in tidy_data_V2.txt file.
