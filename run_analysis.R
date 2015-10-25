require(plyr)

#all the files
dir <- "G:/Coursera/Coursera - R/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset"
features<- paste(dir, "/features.txt", sep = "")
activity_labels <- paste(dir, "/activity_labels.txt", sep = "")
x_train <- paste(dir, "/train/X_train.txt", sep = "")
y_train <- paste(dir, "/train/y_train.txt", sep = "")
subject_train <- paste(dir, "/train/subject_train.txt", sep = "")
x_test  <- paste(dir, "/test/X_test.txt", sep = "")
y_test  <- paste(dir, "/test/y_test.txt", sep = "")
subject_test <- paste(dir, "/test/subject_test.txt", sep = "")

#read the files
featuresd <- read.table(features, colClasses = c("character"))
activity_labelsd <- read.table(activity_labels, col.names = c("ActivityId", "Activity"))
x_traind <- read.table(x_train)
y_traind <- read.table(y_train)
subject_traind <- read.table(subject_train)
x_testd <- read.table(x_test)
y_testd <- read.table(y_test)
subject_testd <- read.table(subject_test)

#create single dataset

trainsensor_data <- cbind(cbind(x_traind, subject_traind), y_traind)
testsensor_data <- cbind(cbind(x_testd, subject_testd), y_testd)
sensor_data <- rbind(trainsensor_data, testsensor_data)

# Label columns
sensor_labels <- rbind(rbind(featuresd, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(sensor_data) <- sensor_labels

#do mean and standard deviation on the data

sensordata_mean_std <- sensor_data[,grepl("mean|std|Subject|ActivityId", names(sensor_data))]

# make names for new data set

sensordata_mean_std <- join(sensordata_mean_std, activity_labelsd, by = "ActivityId", match = "first")
sensordata_mean_std <- sensordata_mean_std[,-1]

#put labels on dataset

names(sensordata_mean_std) <- gsub('\\(|\\)',"",names(sensordata_mean_std), perl = TRUE)
names(sensordata_mean_std) <- make.names(names(sensordata_mean_std))

#output to file

tidy_data_set = ddply(sensordata_mean_std, c("Subject","Activity"), numcolwise(mean))
write.table(tidy_data_set, file = "tidy_data_set.txt",row.names = FALSE)
