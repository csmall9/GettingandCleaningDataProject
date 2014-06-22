GettingandCleaningDataProject 
=============================

The file was prepared by C.T. Small as part of the Getting and Cleaning Data Class Project.

The purpose of the README file is to describe the run_script.  Note this file provides a high level description.  However, it is highly recommended you review the run_script file, because extensive comments have been provided in the file.  

In order to use the scripts in the run_analysis file, the following files must be in the working directory:  

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


These files are part of the dataset for the project which is found here: 

      https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

There is a README.txt included as part of this dataset and I strongly recommend you read it.

 

The run_script.R files does the following:


	1. Merges the training and the test sets to create one data set.  The merged data, which is also in this repository is named: 
    

	2. Extracts only the measurements on the mean and standard deviation for each measurement. The file that contains the extracted measurments is named: 
    		- projectdataExtract-tidy.txt

	3. Uses descriptive activity names to name the activities in the data set.  The descriptive activity names used to describe can be found in this file:                     - 'activity_labels.txt'
    
	4. Appropriately labels the data set with descriptive variable names. The descriptive labels were used from the original data set:  'features.txt'

        5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. The independent tidy data set is named:

          -  tidy_data-averages_by_activityandsub.txt


This run_script.R files contains extensive comments to guide you through the scripts.

For convenience, the following text has been provided for background on the experiements.
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

