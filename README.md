# run_analysis script readme
The run_analysis script merges and analyses the test and train data gathered from accelerometers from the Samsung Galaxy S smartphone.
The script does it in a few main steps:
1) Reading the test data, labeling it and appending the activites and subject columns (code lines 1-11)
2) Reading the train data, labeling it and appending the activites and subject columns (code lines 12-20)
3) Merging the train and test datasets into "combinedData" (code line 21)
4) Creating a dataset "filteredData" of only mean() and std() variables (code lines 22-27)
5) Creating a dataset "summaryData" with the average of each variable for each activity and each subject (code lines 28-30)
