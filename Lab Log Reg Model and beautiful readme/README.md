## __BINARY CLASSIFICATION WITH LOGISTIC REGRESSION__


**__Brief introduction__**

In this notebook we are trying to apply a Logistic Regression Model to a bank database, in order to classify the clients in A or B and predict if their loans are going to be good or bad for the bank benefit. 


__Importing libraries__

First of all we need to know what kind of operations we will do, and import the packages for that.

__Connection to SQL__

We connect to SQL because our database is in there.
Also, we develop the query to get the necessary data. Now we are ready to start working.

### __Exploring the data__

1. We have a look at:
+ The structure
+ The data type
+ The nulls

At this point we noticed that the data in "Age of account" column was unreadable because of its format. So we needed to change that part in the query and transform the format into date, and calculate the difference between the earliest and the latest date to finally obtain the age of account in days. We renamed the column "ageindays".

We also noticed that "Birth number" data is unreadable too so we tried to extract gender from that, but in this case we decided not to change anything because of the complexity required for that operation.

2. We go for visualising the data with histograms or plots so that we can follow exploring.
3. We check the multicollinearity and find out that crime and unemployment variables are correlated. 




### Cleaning and wrangling

+ We drop "type" and "loan_id" columns because they don't give value to the study.
+ Then define the categorical variable. There is only one here, "status", and we transform the column into boolean values in order to reach that A or B classification we talked at the introduction. This will be our y, the dependent variable. 
+ Define the numerical variables as X, they will be our independent variable. And rescaled them. 
+ Split off y and X.
+ Prepare the LOG REG model with sklearn package and the train-test split with a 70-30%.



### Applying the model

+ We apply the Logistic Regression formula to the X and y.
+ Then generate the probability that a loan is A or B. We obtained in most of them 80-86% that is not B, and 11-19% that is B. 
+ Finally evaluate the accuracy of the model. The final score is 0.78
  This result suggest a high accuracy.
  


