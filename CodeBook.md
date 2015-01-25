

- Data was in files x_train, y_train, x_test, y_test, subject_train and subject_test
- Merge files (with rbind) to x_file, y_file and subject_file
- Correct names from file features.txt to columns of file x_file. 
means_and_stds is used to filter only columns where means and standard deviations are.
- Activity labels are in file activity_labels.txt, which is added as a column to y_file
- Merge (with cbind) x_file, y_file and subject_file to big file: all
- From all file is created tidy file (avg_file.txt), where are averages by subjects and activities with aggregate mean function
-
