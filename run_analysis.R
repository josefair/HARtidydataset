##################################################################################################################
##This scritps reads activity data from differente seat of users created from wearable hardware and will output ##
##Tidy data set with the average of each variable for each activity and each subject.                           ##
##                                                                                                              ##
##By: Joseph Sefair                                                                                             ##
##################################################################################################################

##Setting working directory
##setwd("C:/Users/Joseph/Documents/DataScience/UCI HAR Dataset")


        ##########################################################
        ##Read test set, merge it with user and activity.       ##
        ##                                                      ##
        ##########################################################

        ##Read User txt file into a dataframe
        test_data_user <- read.table("./test/subject_test.txt", 
                        sep="\t", 
                        col.names=c("User"))
        
        ##Read Activity for test set and add descriptive activity names to name the activities in the data set
        test_data_activity <- read.table("./test/y_test.txt", 
                                                        sep="\t", 
                                                        col.names=c("activity"))
        test_data_activity$activity[test_data_activity$activity == 1] <- "walking" 
        test_data_activity$activity[test_data_activity$activity == 2] <- "walking_upstairs"
        test_data_activity$activity[test_data_activity$activity == 3] <- "walking_downstairs"
        test_data_activity$activity[test_data_activity$activity == 4] <- "walking_sitting"
        test_data_activity$activity[test_data_activity$activity == 5] <- "walking_standing"
        test_data_activity$activity[test_data_activity$activity == 6] <- "walking_laying"
        

        ##Read test set with column names, first I will ready the column names and then the test set combining column names
        ##Read test set column names
        test_names <- read.table("features.txt", 
                             sep="")

        #Read test set and add the test column headings
        test_data <- read.table("./test/x_test.txt", 
                                 sep="", col.names = test_names[,2])

        ##Merging  all information for the test training datasets
        test_dataset <- cbind(test_data_user, test_data_activity, test_data)
        
        ##########################################################
        ##Read train set, merge it with user and activity.      ##
        ##Uses descriptive activity names to name the activities##
        ##in the data set                                       ##
        ##########################################################
        
        train_data_user <- read.table("./train/subject_train.txt", 
                             sep="\t", 
                             col.names=c("User"))

        ##Read Activity for training set and add descriptive activity names to name the activities in the data set
        train_data_activity <- read.table("./train/y_train.txt", 
                                 sep="\t", 
                                 col.names=c("activity"))
        train_data_activity$activity[train_data_activity$activity == 1] <- "walking" 
        train_data_activity$activity[train_data_activity$activity == 2] <- "walking_upstairs"
        train_data_activity$activity[train_data_activity$activity == 3] <- "walking_downstairs"
        train_data_activity$activity[train_data_activity$activity == 4] <- "walking_sitting"
        train_data_activity$activity[train_data_activity$activity == 5] <- "walking_standing"
        train_data_activity$activity[train_data_activity$activity == 6] <- "walking_laying"


        ##Read train set with column names, first I will ready the column names and then the test set combining column names
        ##Read train set column names
        training_names <- read.table("features.txt", 
                             sep="")

        #Read test set and add the train column headings
        train_data <- read.table("./train/x_train.txt", 
                        sep="", col.names = training_names[,2])

        ##Merging  all information for the test training datasets
        train_dataset <- cbind(train_data_activity, train_data_user, train_data)


        ##########################################################
        ##Merge training and test datasets                      ##
        ##Extract only measurements on mean and std             ## 
        ##########################################################

        merged_dataset <- rbind(test_dataset, train_dataset)    
        merged_dataset_mean_std <- merged_dataset[,c("activity","User", colnames(merged_dataset)[grepl("mean[[:punct:]]|std[[:punct:]]", colnames(merged_dataset))])]

        ##########################################################
        ##Merge training and test datasets                      ##
        ##Extract only measurements on mean and std             ##
        ##Appropriately labels the data set with descriptive    ##
        ##variable names                                        ## 
        ##########################################################

        column_names <- c("Activity", "User", "Accelerometer_Body_Mean_X", "Accelerometer_Body_Mean_Y", "Accelerometer_Body_Mean_Z", 
        "Accelerometer_Body_Std_X", "Accelerometer_Body_Std_Y", "Accelerometer_Body_Std_Z", "Accelerometer_Gravity_Mean_X",
        "Accelerometer_Gravity_Mean_Y", "Accelerometer_Gravity_Mean_Z", "Accelerometer_Gravity_Std_X", "Accelerometer_Gravity_Std_Y", 
        "Accelerometer_Gravity_Std_Z", "Jerk_Accelerometer_Body_Mean_X", "Jerk_Accelerometer_Body_Mean_Y", "Jerk_Accelerometer_Body_Mean_Z", 
        "Jerk_Accelerometer_Body_Std_X", "Jerk_Accelerometer_Body_Std_Y", "Jerk_Accelerometer_Body_Std_Z", "Gyroscope_Body_Mean_X",
        "Gyroscope_Body_Mean_Y", "Gyroscope_Body_Mean_Z", "Gyroscope_Body_Std_X", "Gyroscope_Body_Std_Y", "Gyroscope_Body_Std_Z", 
        "Jerk_Gyroscope_Body_Mean_X", "Jerk_Gyroscope_Body_Mean_Y", "Jerk_Gyroscope_Body_Mean_Z", "Jerk_Gyroscope_Body_Std_X", 
        "Jerk_Gyroscope_Body_Std_Y" , "Jerk_Gyroscope_Body_Std_Z", "Mag_Accelerometer_Body_Mean", "Mag_Accelerometer_Body_Std", "Mag_Accelerometer_Gravity_Mean",
        "Mag_Accelerometer_Gravity_Std", "Jerk_Mag_Accelometer_Body_Mean", "Jerk_Mag_Accelometer_Body_Std", "Mag_Gyroscope_Body_Mean", 
        "Mag_Gyroscope_Body_Std", "Jerk_Mag_Gyroscope_Body_Mean", "Jerk_Mag_Gyroscope_Body_Std", "FFT_Accelometer_Body_Mean_X", 
        "FFT_Accelometer_Body_Mean_Y", "FFT_Accelometer_Body_Mean_Z", "FFT_Accelometer_Body_Std_X", "FFT_Accelometer_Body_Std_Y", 
        "FFT_Accelometer_Body_Std_Z" , "FFT_Jerk_Accelometer_Body_Mean_X", "FFT_Jerk_Accelometer_Body_Mean_Y", "FFT_Jerk_Accelometer_Body_Mean_Z",
        "FFT_Jerk_Accelometer_Body_Std_X", "FFT_Jerk_Accelometer_Body_Std_Y", "FFT_Jerk_Accelometer_Body_Std_Z", "FFT_Gyroscope_Body_Mean_X", 
        "FFT_Gyroscope_Body_Mean_Y", "FFT_Gyroscope_Body_Mean_Z", "FFT_Gyroscope_Body_Std_X", "FFT_Gyroscope_Body_Std_Y", "FFT_Gyroscope_Body_Std_Z",
        "FFT_Mag_Accelometer_Body_Mean", "FFT_Mag_Accelometer_Body_Std", "FFT_Jerk_Mag_Accelometer_Body_Body_Mean" , "FFT_Jerk_Mag_Accelometer_Body_Body_Std",
        "FFT_Mag_Gyroscope_Body_Body_Mean", "FFT_Mag_Gyroscope_Body_Body_Std", "FFT_Jerk_Mag_Gyroscope_Body_Body_Mean", "FFT_Jerk_Mag_Gyroscope_Body_Body_Std")

        colnames(merged_dataset_mean_std) <- column_names 

        ##########################################################
        ##creates a second, independent tidy data set with the  ##
        ##average of each variable                              ##
        ##for each activity and each subject.                   ##
        ##                                                      ## 
        ##########################################################

        desc_variable <- cbind(merged_dataset_mean_std[,3], merged_dataset_mean_std[,4], merged_dataset_mean_std[,5], merged_dataset_mean_std[,6], 
                   merged_dataset_mean_std[,7], merged_dataset_mean_std[,8], merged_dataset_mean_std[,9], merged_dataset_mean_std[,10], 
                   merged_dataset_mean_std[,11], merged_dataset_mean_std[,12], merged_dataset_mean_std[,13], merged_dataset_mean_std[,14], 
                   merged_dataset_mean_std[,15], merged_dataset_mean_std[,16], merged_dataset_mean_std[,17], merged_dataset_mean_std[,18], 
                   merged_dataset_mean_std[,19], merged_dataset_mean_std[,20], merged_dataset_mean_std[,21], merged_dataset_mean_std[,22], 
                   merged_dataset_mean_std[,23], merged_dataset_mean_std[,24], merged_dataset_mean_std[,25], merged_dataset_mean_std[,26], 
                   merged_dataset_mean_std[,27], merged_dataset_mean_std[,28], merged_dataset_mean_std[,29], merged_dataset_mean_std[,30],
                   merged_dataset_mean_std[,31], merged_dataset_mean_std[,32], merged_dataset_mean_std[,33], merged_dataset_mean_std[,34], 
                   merged_dataset_mean_std[,35], merged_dataset_mean_std[,36], 
                   merged_dataset_mean_std[,37], merged_dataset_mean_std[,38], merged_dataset_mean_std[,39], merged_dataset_mean_std[,40], 
                   merged_dataset_mean_std[,41], merged_dataset_mean_std[,42], merged_dataset_mean_std[,43], merged_dataset_mean_std[,44], 
                   merged_dataset_mean_std[,45], merged_dataset_mean_std[,46], merged_dataset_mean_std[,47], merged_dataset_mean_std[,48], 
                   merged_dataset_mean_std[,49], merged_dataset_mean_std[,50], merged_dataset_mean_std[,51], merged_dataset_mean_std[,52], 
                   merged_dataset_mean_std[,53], merged_dataset_mean_std[,54], merged_dataset_mean_std[,55], merged_dataset_mean_std[,56], 
                   merged_dataset_mean_std[,57], merged_dataset_mean_std[,58], merged_dataset_mean_std[,59], merged_dataset_mean_std[,60],
                   merged_dataset_mean_std[,61], merged_dataset_mean_std[,62], merged_dataset_mean_std[,63], merged_dataset_mean_std[,64], 
                   merged_dataset_mean_std[,65], merged_dataset_mean_std[,66], merged_dataset_mean_std[,67], merged_dataset_mean_std[,68])
       
        tidy_data_avg_activity_user <- aggregate(desc_variable ~ merged_dataset_mean_std$Activity+merged_dataset_mean_std$User, data = merged_dataset_mean_std, mean)
        
        column_names_avg_activity_user <- c("Activity", "User", "Avg_Accelerometer_Body_Mean_X", "Avg_Accelerometer_Body_Mean_Y", "Avg_Accelerometer_Body_Mean_Z", 
                  "Avg_Accelerometer_Body_Std_X", "Avg_Accelerometer_Body_Std_Y", "Avg_Accelerometer_Body_Std_Z", "Avg_Accelerometer_Gravity_Mean_X",
                  "Avg_Accelerometer_Gravity_Mean_Y", "Avg_Accelerometer_Gravity_Mean_Z", "Avg_Accelerometer_Gravity_Std_X", "Avg_Accelerometer_Gravity_Std_Y", 
                  "Avg_Accelerometer_Gravity_Std_Z", "Avg_Jerk_Accelerometer_Body_Mean_X", "Avg_Jerk_Accelerometer_Body_Mean_Y", "Avg_Jerk_Accelerometer_Body_Mean_Z", 
                  "Avg_Jerk_Accelerometer_Body_Std_X", "Avg_Jerk_Accelerometer_Body_Std_Y", "Avg_Jerk_Accelerometer_Body_Std_Z", "Avg_Gyroscope_Body_Mean_X",
                  "Avg_Gyroscope_Body_Mean_Y", "Avg_Gyroscope_Body_Mean_Z", "Avg_Gyroscope_Body_Std_X", "Avg_Gyroscope_Body_Std_Y", "Avg_Gyroscope_Body_Std_Z", 
                  "Avg_Jerk_Gyroscope_Body_Mean_X", "Avg_Jerk_Gyroscope_Body_Mean_Y", "Avg_Jerk_Gyroscope_Body_Mean_Z", "Avg_Jerk_Gyroscope_Body_Std_X", 
                  "Avg_Jerk_Gyroscope_Body_Std_Y" , "Avg_Jerk_Gyroscope_Body_Std_Z", "Avg_Mag_Accelerometer_Body_Mean", "Avg_Mag_Accelerometer_Body_Std", "Avg_Mag_Accelerometer_Gravity_Mean",
                  "Avg_Mag_Accelerometer_Gravity_Std", "Avg_Jerk_Mag_Accelometer_Body_Mean", "Avg_Jerk_Mag_Accelometer_Body_Std", "Avg_Mag_Gyroscope_Body_Mean", 
                  "Avg_Mag_Gyroscope_Body_Std", "Avg_Jerk_Mag_Gyroscope_Body_Mean", "Avg_Jerk_Mag_Gyroscope_Body_Std", "Avg_FFT_Accelometer_Body_Mean_X", 
                  "Avg_FFT_Accelometer_Body_Mean_Y", "Avg_FFT_Accelometer_Body_Mean_Z", "Avg_FFT_Accelometer_Body_Std_X", "Avg_FFT_Accelometer_Body_Std_Y", 
                  "Avg_FFT_Accelometer_Body_Std_Z" , "Avg_FFT_Jerk_Accelometer_Body_Mean_X", "Avg_FFT_Jerk_Accelometer_Body_Mean_Y", "Avg_FFT_Jerk_Accelometer_Body_Mean_Z",
                  "Avg_FFT_Jerk_Accelometer_Body_Std_X", "Avg_FFT_Jerk_Accelometer_Body_Std_Y", "Avg_FFT_Jerk_Accelometer_Body_Std_Z", "Avg_FFT_Gyroscope_Body_Mean_X", 
                  "Avg_FFT_Gyroscope_Body_Mean_Y", "Avg_FFT_Gyroscope_Body_Mean_Z", "Avg_FFT_Gyroscope_Body_Std_X", "Avg_FFT_Gyroscope_Body_Std_Y", "Avg_FFT_Gyroscope_Body_Std_Z",
                  "Avg_FFT_Mag_Accelometer_Body_Mean", "Avg_FFT_Mag_Accelometer_Body_Std", "Avg_FFT_Jerk_Mag_Accelometer_Body_Body_Mean" , "Avg_FT_Jerk_Mag_Accelometer_Body_Body_Std",
                  "Avg_FFT_Mag_Gyroscope_Body_Body_Mean", "Avg_FFT_Mag_Gyroscope_Body_Body_Std", "Avg_FFT_Jerk_Mag_Gyroscope_Body_Body_Mean", "Avg_FFT_Jerk_Mag_Gyroscope_Body_Body_Std")

        colnames(tidy_data_avg_activity_user) <- column_names_avg_activity_user 


        ##########################################################
        ##Writting table to file tidy_data_avg_activity_user.txt##
        ##No row names                                          ##
        ##########################################################

        write.table(tidy_data_avg_activity_user, 'tidy_data_avg_activity_user.txt', row.name=FALSE)
