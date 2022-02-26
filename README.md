# Classification_Dallas_Shootings
Mid bootcamp project for data analytics course at Ironhack using the "On-Duty Officer Involved Shootings Data" from the Dallas Police Department for a classification case study.

## Background
This case study is the mid term project of my Ironhack Data Analytics Bootcamp. Since the last project in this bootcamp involved a linear regression model, I settled on working on a classification model.

## Scenario
Imagine I would be working with the Dallas Police Department to help to improve the safety of the officers and the citizens of Dallas. Reducing fatal incidents (of subjects) might be possible if the conditions leading to such fatal incidents could be narrowed down and avoided.

## Objectives
Create a classification model to predict the outcome of a shooting incident using the available data on officers, subjects and incidents.
Figure out the relevant triggers that have a high probability to result in fatal shootings.

## Limitations
This model is restricted by the information in the database and limited amount of cases (219). For instance there is little information in the database about the officers, their years of experience as a cop, their shooting abilities, their training etc. Even though the pdf summaries of the incidents are providing some more information, the two week period of this project will probably not allow enough time to read through all cases and add the relevant information to the database. The same holds true for information on the subjects and information on the incidents itself. 

## Available Data
The original database consists of three tables. One table about name, last name, race and gender of the involved officers, one table about name, last name, race and gender of the subjects and one table with information about the incidents with a case_number that is foreign key to the other two tables. After reviewing the available data with MySQL, I decided to keep all relevant information of the incidents table, as well as race and gender of the subjects. I did not use race and gender of the officers involved, since there are several cases in which two or more officers were involved, which would have resulted in too many cases with missing race/gender information. In case of subjects, there were only very few cases with more than one subject. I decided to drop those ones in favour of having race/gender of subjects for each case. After joining tables, the data extract used for further analysis contains the following information:

1. case_number - unique ID of incident
2. date - date of incident
3. location - location of incident
4. subject_statuses - outcome of incident (shoot and miss, injured, deceased)
5. subject_weapon - weapon of the subject used in incident
6. subject_count - number of subjects, is always one, just kept for checking
7. subject_race - race of subject (B (black), W (white), L (latin), A (asian)
8. subject_gender
9. officer_count - number of officers involved
10. latitude
11. longitude

For detailed information about retrieving the data extract, see the sql file in this repository. 

## Steps of analysis
1. Data Exploration and Cleaning
2. Preparing data for modeling
3. Build and run different models
4. Review results and create PowerPoint slides for presentation
5. Using tableau for descriptive statistics visualizations
6. Preparing presentation (PPT and tableau)

## Links and materials
Database used:
'Dallas' from https://relational.fit.cvut.cz/search

Original data/website of Dallas police department
https://www.dallasopendata.com/Public-Safety/Dallas-Police-Officer-Involved-Shootings/4gmt-jyx2


