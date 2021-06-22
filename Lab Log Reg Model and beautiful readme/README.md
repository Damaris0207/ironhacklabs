__BINARY CLASSIFICATION WITH LOGISTIC REGRESSION__


**__Fresh introduction__**
In this notebook we are trying to apply a Logistic Regression Model to a bank database, in order to classify the clients in A or B and predict if their loans are going to be good or bad for the bank benefit. 


__Importing libraries__
First of all we need to know what kind of operations we will do, and import the packages for that.

__Connection to SQL__
We connect to SQL because our database is in there.
Also, we develop the query to get the necessary data. Now we can start working.

__Exploring the data__
We have a look at:
+ The structure
+ The data type
+ The nulls

At this point we noticed that the data in "Age of account" column was unreadable because of its format. So we needed to change that part in the query and transform the format into date, and calculate the difference between the earliest and the latest date to finally obtain the age of account in days. We renamed the column "ageindays".


