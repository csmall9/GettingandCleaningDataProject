## This the the file that can run to achieve the Project Assignment
## 
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
testdataframe <- cbind(y_test, subject_test, testdata)
head(testdataframe, 1)

### This portion of the script combines the training data

trainingdata <- read.table ("X_train.txt")
head(trainingdata)

y_train <- read.table ("y_train.txt")
head(y_train)

subject_train <- read.table("subject_train.txt")
head(subject_train)

##  Add column names to test data,  read column name information from file.

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
trainingtdataframe <- cbind(y_train, subject_train, trainingdata)
head(trainingdataframe, 1)

## Now combine the test data with the training data

alldataframe <- rbind(testdataframe, trainingdataframe)

## Need to extract only the measurements on the mean and standard deviation for each measurement.
## get the columns that mean() and std()

  extractCols <- grep("-mean\\(\\)|-std\\(\\)", names(alldataframe))
  extractCols
  nmeanstd <- length(extractCols)



### reshape

*************************************************  
  ## executed from "projectdata" directory
  ## copy all files to the "projectdata" direcory
  
  
  extractdataframe <- alldataframe[1]  #test_activityextractdataframe <- cbind(extractdataframe, alldataframe$"subject_identifier")
  head(extractdataframe,3)
  length(extractdataframe)
  extractdataframe <- cbind(extractdataframe, alldataframe[2])   ##"subject_identifier")

  
  
#####

Try "-mean\\(\\)"
ncolumns <-length(extractCols)
for(i in 1:ncolumns){
  print(names(alldataframe[extractCols[i]]))
  newcolumn[i] <- alldataframe[extractCols[i]]
  extractdataframe <- cbind(extractdataframe, newcolumn[i])
}  
head(extractdataframe, 3)