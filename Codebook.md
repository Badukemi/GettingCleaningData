#Codebook for the Getting and Cleaning Data Project

Objective is to combine two data sets each comprising three files and clean the data ready for analysis.
See the readme for the locaiton of the files.

Requires the dplyr package to be installed.

##Variables

The data includes accelerometer information in different axes from the Samsung phone.
In addition the subject (person) was added identified by a number.

The activity being undertaken was also added under 'activity' and these are:

* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

##Transformation
The data is aggregated into a file with the means of all the data by activities and by participants.
Output is a single file tidyData.csv which is 180 rows by 88 columns
