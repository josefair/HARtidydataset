==================================================================
TidyData Project for Coursera.Org based on data comming from Human Activity Recognition Using Smartphones Dataset
==================================================================
by Joseph Sefair
==================================================================

Study Section

In this project a final independent tidy dataset was created contain the average for the mean and standard deviation of each variable contained in the human activity recognization using smart phone study dataset at:  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The study included the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

More information about this study and the data is in the readme.txt inside the get_project_files_Uci_HAR_Dataset.zip 

Section Code book

This section describes the tidydataset, each variable and its units.  In summary this tidy set contains the average of measurements taken and transformed for each user per activity that user performed.  

"Activity":  Includes values for the activty that each person performed.  These are ix activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.  

"User":  Unique identifier for a user that was part of the 30 people in the experiment.  

"Average of the measurements"

The next variables are the average taken for each variable that contain the mean and std of the experiment.  There were mainly two signals taken for each user in the experiment, the body acceleration (Avg_Accelerometer_Body_Mean) and angular velocity (Avg_Gyroscope_Body_Mean).  Each one of them was taken for there axis X,YZ directions (X,Y,Z).  The acceleration signal was separated into body (Avg_Accelerometer_Body) and gravity accelaration (Avg_Accelerometer_Gravity_Mean).  

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Avg_Jerk_Accelerometer) and Avg_Jerk_Gyroscope). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Avg_Mag_Accelerometer, Avg_Mag_Gyroscope). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing (Avg_FFT_Accelometer, Avg_FFT_Gyroscope)

Below the name of each variable that the mean and std was calculated.

"Avg_Accelerometer_Body_Mean_X"
"Avg_Accelerometer_Body_Mean_Y"
"Avg_Accelerometer_Body_Mean_Z"
"Avg_Accelerometer_Body_Std_X"
"Avg_Accelerometer_Body_Std_Y"
"Avg_Accelerometer_Body_Std_Z"
"Avg_Accelerometer_Gravity_Mean_X"
"Avg_Accelerometer_Gravity_Mean_Y"
"Avg_Accelerometer_Gravity_Mean_Z"
"Avg_Accelerometer_Gravity_Std_X"
"Avg_Accelerometer_Gravity_Std_Y"
"Avg_Accelerometer_Gravity_Std_Z"
"Avg_Jerk_Accelerometer_Body_Mean_X"
"Avg_Jerk_Accelerometer_Body_Mean_Y"
"Avg_Jerk_Accelerometer_Body_Mean_Z"
"Avg_Jerk_Accelerometer_Body_Std_X" "Avg_Jerk_Accelerometer_Body_Std_Y" "Avg_Jerk_Accelerometer_Body_Std_Z"
"Avg_Gyroscope_Body_Mean_X"
"Avg_Gyroscope_Body_Mean_Y"
"Avg_Gyroscope_Body_Mean_Z"
"Avg_Gyroscope_Body_Std_X"
"Avg_Gyroscope_Body_Std_Y"
"Avg_Gyroscope_Body_Std_Z"                  "Avg_Jerk_Gyroscope_Body_Mean_X"
"Avg_Jerk_Gyroscope_Body_Mean_Y"
"Avg_Jerk_Gyroscope_Body_Mean_Z"
"Avg_Jerk_Gyroscope_Body_Std_X"                  "Avg_Jerk_Gyroscope_Body_Std_Y"
"Avg_Jerk_Gyroscope_Body_Std_Z"
"Avg_Mag_Accelerometer_Body_Mean"
"Avg_Mag_Accelerometer_Body_Std"
"Avg_Mag_Accelerometer_Gravity_Mean"                  "Avg_Mag_Accelerometer_Gravity_Std" "Avg_Jerk_Mag_Accelometer_Body_Mean" "Avg_Jerk_Mag_Accelometer_Body_Std"
"Avg_Mag_Gyroscope_Body_Mean"
"Avg_Mag_Gyroscope_Body_Std"
"Avg_Jerk_Mag_Gyroscope_Body_Mean"
"Avg_Jerk_Mag_Gyroscope_Body_Std"
"Avg_FFT_Accelometer_Body_Mean_X"                  "Avg_FFT_Accelometer_Body_Mean_Y"
"Avg_FFT_Accelometer_Body_Mean_Z"
"Avg_FFT_Accelometer_Body_Std_X"
"Avg_FFT_Accelometer_Body_Std_Y"                  "Avg_FFT_Accelometer_Body_Std_Z" "Avg_FFT_Jerk_Accelometer_Body_Mean_X"
"Avg_FFT_Jerk_Accelometer_Body_Mean_Y" "Avg_FFT_Jerk_Accelometer_Body_Mean_Z"                  "Avg_FFT_Jerk_Accelometer_Body_Std_X" "Avg_FFT_Jerk_Accelometer_Body_Std_Y" "Avg_FFT_Jerk_Accelometer_Body_Std_Z"
"Avg_FFT_Gyroscope_Body_Mean_X"
"Avg_FFT_Gyroscope_Body_Mean_Y"
"Avg_FFT_Gyroscope_Body_Mean_Z"
"Avg_FFT_Gyroscope_Body_Std_X"
"Avg_FFT_Gyroscope_Body_Std_Y"
"Avg_FFT_Gyroscope_Body_Std_Z"                  "Avg_FFT_Mag_Accelometer_Body_Mean"
"Avg_FFT_Mag_Accelometer_Body_Std"
"Avg_FFT_Jerk_Mag_Accelometer_Body_Body_Mean"
"Avg_FT_Jerk_Mag_Accelometer_Body_Body_Std"                "Avg_FFT_Mag_Gyroscope_Body_Body_Mean"
"Avg_FFT_Mag_Gyroscope_Body_Body_Std"
"Avg_FFT_Jerk_Mag_Gyroscope_Body_Body_Mean" "Avg_FFT_Jerk_Mag_Gyroscope_Body_Body_Std"

