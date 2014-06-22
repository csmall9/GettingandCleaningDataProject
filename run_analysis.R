## Project for Getting and Cleaning Data

## Merges the training and the test sets to create one data set.
  
## This portion of the script combines the training data  
  
  ##  Step 1 - Read in test data (x_test.txt, y_test.txt, and subject_test.txt)
  
  testdata <- read.table ("X_test.txt")
  head(testdata)

  y_test <- read.table ("y_test.txt")
  head(y_test)

  subject_test <- read.table("subject_test.txt")
  head(subject_test)

##  Add column names to test data,  read column name information from file.

  features <- read.table ("features.txt")
  features
  colheader <- features[,2]

  names(testdata) <- colheader
  head(testdata,1)

  names(y_test) <- c("test_activity")
  names(y_test)
  head(y_test,3)
  names(subject_test)
  names(subject_test) <- c("subject_identifier")
  names(subject_test)


## Change activity names to readable names in test data

for (i in 1:nrow(y_test)){
  if (y_test[i,] == "1"){
    print(y_test[i,])
    y_test[i,] <- "WALKING"
  }
  else if (y_test[i,] == "2"){
    y_test[i,] <- "WALKING_UPSTAIRS"
  }     else if ( y_test[i,] == "3"){
    y_test[i,] <- "WALKING_DOWNSTAIRS"
  }
  else if (y_test[i,] == "4"){
    y_test[i,] <- "SITTING"
  }
  else if(y_test[i,] == "5"){
    print(y_test[i,])
    y_test[i,] <- "STANDING"
  }
  else if (y_test[i,] == "6"){
    y_test[i,] <- "LAYING"
  }
}

## Now the the "test" data is tidy,  combine the test files
testdataframe <- cbind(y_test, subject_test, testdata)
head(testdataframe, 1)

### This portion of the script combines the training data

trainingdata <- read.table ("X_train.txt")
head(trainingdata)

y_train <- read.table ("y_train.txt")
head(y_train)

subject_train <- read.table("subject_train.txt")
head(subject_train)

##  Add column names to training data,  read column name information from file.
##  Note:  you do not have to read the features file again, but just in case the script in not run all togeher

features <- read.table ("features.txt")
features
colheader <- features[,2]

names(trainingdata) <- colheader
head(trainingdata,1)

names(y_train) <- c("test_activity")
names(y_train)
head(y_train,3)
names(subject_train)
names(subject_train) <- c("subject_identifier")
names(subject_train)


## Change activity names to readable names in test data

for (i in 1:nrow(y_train)){
  if (y_train[i,] == "1"){
    print(y_train[i,])
    y_train[i,] <- "WALKING"
  }
  else if (y_train[i,] == "2"){
    y_train[i,] <- "WALKING_UPSTAIRS"
  }     else if ( y_train[i,] == "3"){
    y_train[i,] <- "WALKING_DOWNSTAIRS"
  }
  else if (y_train[i,] == "4"){
    y_train[i,] <- "SITTING"
  }
  else if(y_train[i,] == "5"){
    print(y_train[i,])
    y_train[i,] <- "STANDING"
  }
  else if (y_train[i,] == "6"){
    y_train[i,] <- "LAYING"
  }
}

## Combine the training data
  
trainingdataframe <- cbind(y_train, subject_train, trainingdata)
head(trainingdataframe, 1)

## Now combine the test data with the training data

alldataframe <- rbind(testdataframe, trainingdataframe)

## Need to extract only the measurements on the mean and standard deviation for each measurement.
## get the columns that mean() and std()

  extractCols <- grep("-mean\\(\\)|-std\\(\\)", names(alldataframe))
  extractCols
  
## Now extract the mean() and std() columns and combine together in an new dataframe 

ncolumns <-length(extractCols)
colnums <- 0  
for(i in 1:ncolumns){
  colnums <- colnums +1
  newcolumn <- alldataframe[extractCols[i]]
  if (colnums == 1){
  print(names(alldataframe[extractCols[i]]))
  extractdataframe <- newcolumn
  }
  else{
  extractdataframe <- cbind(extractdataframe, newcolumn)
  } 
}
head(extractdataframe, 3)
  
## prior to writing the file, add the test activity and subject colums

  test_activity <- alldataframe$"test_activity"
  subject_identifier <- alldataframe$"subject_identifier"
  columns <- cbind.data.frame(testactivity, subject)
  names(columns) <- c("test_activity", "subject_identifier")
  head(columns,3)  

  extractdataframe <- cbind.data.frame(columns, extractdataframe)
  head(extractdataframe,2)
  
## Write the extracted data file -- 

write.table(extractdataframe, file = "projectdataExtract2-tidy.txt", append = FALSE, quote = FALSE, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")

### Need to generate the independent tidy file

#################################################################  

  
  
  extractdataframe <- alldataframe[1]  #test_activityextractdataframe <- cbind(extractdataframe, alldataframe$"subject_identifier")
  head(extractdataframe,3)
  length(extractdataframe)
  extractdataframe <- cbind(extractdataframe, alldataframe[2])   ##"subject_identifier")

activitysplit <- split(extractdataframe, extractdataframe$test_activity)

names(activitysplit)
      activitysplit[[1]]$"fBodyAccJerk-std()-X"

mean1 <- mean(activitysplit[[1]]$"fBodyAccJerk-std()-X")


  
  
#####


  
  ## combine extracted variables with test and subject columns
  
  testactivity <- alldataframe$"test_activity"
  subject <- alldataframe$"subject_identifier"
  columns <- cbind(testactivity, subject)
  head(columns,3)
  
head(extractdataframe, 3)

write.table(extractdataframe, file = "projectdataExtract-tidy.txt", append = FALSE, quote = FALSE, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")

length(activitysplit)

## Final activity is to generate an independent tidy file that calculates
## mean for the variables by activity and subject.  

mean1<- mean(activitysplit[1]$"fBodyBodyAccJerkMag-mean()")
newframe <- tapply(extractdataframe$"fBodyBodyGyroJerkMag-std()", extractdataframe$"test_activity",mean)

rownumber <- 0
for (i in 3:68){
  rowinframe <- tapply(extractdataframe[,i], extractdataframe$"test_activity",mean)
  rownumber<- rownumber +1
  if (i == 3) { 
      totalnewframe <- rowinframe
  }
  else{
    totalnewframe <- rbind(totalnewframe, rowinframe)
  }
} 
rownames(totalnewframe) <- allcolumns[3:68]

write.table(totalnewframe, file = "tidy_data-averages_by_activity.txt", append = FALSE, quote = FALSE, sep = " ",
            eol = "\n", na = "NA", dec = ".", row.names = TRUE,
            col.names = TRUE, qmethod = c("escape", "double"),
            fileEncoding = "")
e