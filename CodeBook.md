<h1>  Code Book </h1> 
<h2> Final Project</h2>


<h3> Human Activity Recognition Using Smartphones Data Set</h3>

<p>Source data set    <a href ="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">DATA</a>  </p>


<h3> Basic Informations (by authors)</h3>

<p>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
</p>


<h3> Current variable names </h3>

<ul>
<li>
activities - describe each activity realized along the record (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
</li>
<li>
The other variables: Their name is composed like  AB-C-D:
<ul>
<li>A = time or freq -represent if the record is in funtion the time or the frequency</li>
<li> B = LinearAcceleration, AngularVelocity, GravityAcc </li>
<li> C = sd or mean. It represents what was measured of each variable original, the mean or standard desviation (sd)</li>
<li> D = the axes of movement - X , Y or Z (Cartesian axes) </li>
</ul>
</ul>

<h3> Processing the Data Set </h3>
<p> The training and and tes data sets were joint in a unique data frame. 
Besides this we take just the variables that measures the mean and the standard desviation of each record.
A new variable describing the activity was added to Data Set. Moreove, the variable names were simplified.
</p>

<h3> Final data set</h3>

<p>
We compute the mean of each variable (collumn) for each activity.
The data frame obtained can be accessed in <a href="https://github.com/schaeferrodrigo/Getting-and-Cleaning-Data-Course-Project/blob/master/Mean_data.csv" > Mean_data </a>.
</p>


</p>

</p>
