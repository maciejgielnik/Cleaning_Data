This is a CodeBook for tidy_data.txt written by Maciej Gielnik for Coursera Getting and Cleaning Data Course Project

DATA
The original data (also known as UCI HAR Dataset) comes from:
Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws



DESCRIPTIONS

Identifiers:


col number          col name
1                           activity  - a type a activity performed by subject of test
2                            subject  - ID of a pearson who performed activity

MEASUREMENTS:


col number          col name
3                      tbodyaccmeanx
4                      tbodyaccmeany
5                      tbodyaccmeanz
6                   tgravityaccmeanx
7                   tgravityaccmeany
8                   tgravityaccmeanz
9                  tbodyaccjerkmeanx
10                 tbodyaccjerkmeany
11                 tbodyaccjerkmeanz
12                    tbodygyromeanx
13                    tbodygyromeany
14                    tbodygyromeanz
15                tbodygyrojerkmeanx
16                tbodygyrojerkmeany
17                tbodygyrojerkmeanz
18                   tbodyaccmagmean
19                tgravityaccmagmean
20               tbodyaccjerkmagmean
21                  tbodygyromagmean
22              tbodygyrojerkmagmean
23                     fbodyaccmeanx
24                     fbodyaccmeany
25                     fbodyaccmeanz
26                 fbodyaccmeanfreqx
27                 fbodyaccmeanfreqy
28                 fbodyaccmeanfreqz
29                 fbodyaccjerkmeanx
30                 fbodyaccjerkmeany
31                 fbodyaccjerkmeanz
32             fbodyaccjerkmeanfreqx
33             fbodyaccjerkmeanfreqy
34             fbodyaccjerkmeanfreqz
35                    fbodygyromeanx
36                    fbodygyromeany
37                    fbodygyromeanz
38                fbodygyromeanfreqx
39                fbodygyromeanfreqy
40                fbodygyromeanfreqz
41                   fbodyaccmagmean
42               fbodyaccmagmeanfreq
43           fbodybodyaccjerkmagmean
44       fbodybodyaccjerkmagmeanfreq
45              fbodybodygyromagmean
46          fbodybodygyromagmeanfreq
47          fbodybodygyrojerkmagmean
48      fbodybodygyrojerkmagmeanfreq
49          angletbodyaccmeangravity
50  angletbodyaccjerkmeangravitymean
51     angletbodygyromeangravitymean
52 angletbodygyrojerkmeangravitymean
53                 anglexgravitymean
54                 angleygravitymean
55                 anglezgravitymean
56                      tbodyaccstdx
57                      tbodyaccstdy
58                      tbodyaccstdz
59                   tgravityaccstdx
60                   tgravityaccstdy
61                   tgravityaccstdz
62                  tbodyaccjerkstdx
63                  tbodyaccjerkstdy
64                  tbodyaccjerkstdz
65                     tbodygyrostdx
66                     tbodygyrostdy
67                     tbodygyrostdz
68                 tbodygyrojerkstdx
69                 tbodygyrojerkstdy
70                 tbodygyrojerkstdz
71                    tbodyaccmagstd
72                 tgravityaccmagstd
73                tbodyaccjerkmagstd
74                   tbodygyromagstd
75               tbodygyrojerkmagstd
76                      fbodyaccstdx
77                      fbodyaccstdy
78                      fbodyaccstdz
79                  fbodyaccjerkstdx
80                  fbodyaccjerkstdy
81                  fbodyaccjerkstdz
82                     fbodygyrostdx
83                     fbodygyrostdy
84                     fbodygyrostdz
85                    fbodyaccmagstd
86            fbodybodyaccjerkmagstd
87               fbodybodygyromagstd
88           fbodybodygyrojerkmagstd




TRANSFORMATIONS

1. Merging the training and the test sets to create one data set.
2. Rename column names to remove dashes, parenthesis and change all letters to lowercase.
3. Extracting only the columns that have word mean or std in name.
4. Adding a column with description of activity.
5. Adding a column with ID of a subject.
6. Gruping data by activity, then on subject.
7. Calculating mean for every activity and every subject.
8. Exporting data as tidy_data.txt.

















