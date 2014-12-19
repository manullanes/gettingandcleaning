# Setting of the working directory
setwd("~/DATA_PROJECT/UCI HAR Dataset")

# Reading of the Features labels with only the mean and sd information
features<-read.csv("./features.txt",sep="-",header=FALSE)
subsetData<-(features$V2=="mean()" | features$V2=="std()")
features<-read.csv("./features.txt",sep="",header=FALSE)
features<-features[subsetData,]
features<-features$V2
features<-as.character(features)
# Readind of the Activity Labels
activity<-read.csv("./activity_labels.txt",sep="",header=FALSE)

# Subdirectory of the Test files
setwd("./test")

# Reading of the subjects test, test and labels
# only means and sd!
subject_test<-read.table("./subject_test.txt")
X_test<-read.csv("./X_test.txt",sep="",header=FALSE)
X_test<-X_test[,subsetData]
Y_test<-read.table("./Y_test.txt")
Y_test<-as.factor(Y_test$V)
levels(Y_test)<-activity$V2
Y_test<-as.data.frame(Y_test)

# Creation of the Test Data
test<-data.frame(subject_test,Y_test,X_test)
names(test)<-c("id_subject","id_activity",features)

# Subdirectory of the Train files
setwd("~/DATA_PROJECT/UCI HAR Dataset")
setwd("./train")

# Reading of the subjects test, test and labels
# only means and sd!
subject_train<-read.table("./subject_train.txt")
X_train<-read.csv("./X_train.txt",sep="",header=FALSE)
X_train<-X_train[,subsetData]
Y_train<-read.table("./Y_train.txt")
Y_train<-as.factor(Y_train$V)
levels(Y_train)<-activity$V2
Y_train<-as.data.frame(Y_train)

# Creation of the Training Data
train<-data.frame(subject_train,Y_train,X_train)
names(train)<-c("id_subject","id_activity",features)

# Mergin of the Test and Train data
completeData<-rbind(test,train)

# Reshaping
library(reshape2)
meltData<-melt(completeData,id=c("id_subject","id_activity"))
finalData<-dcast(meltData,id_subject+id_activity~variable,mean)

# Writting of the tidy data in the DATA_PROJECT folder
setwd("~/DATA_PROJECT")
write.table(finalData,file="tidyData.txt",row.name=FALSE)
