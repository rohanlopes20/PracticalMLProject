# Practical Machine Learning Project

## :video_game:	Loading and cleaning the Data :
All functions are loaded and assigned to variables. Also, the seed is set so the pseudo-random number generator operates in a consistent way for repeat-ability.

## :file_folder: Download the files and read them into memory :
The files are read into memory. Various indicators of missing data (i.e., “NA”, “#DIV/0!” and “”) are all set to NA so they can be processed.

## :mechanic:	Remove unnecessary columns :
Columns that are not required for the model and columns that contain NAs are eliminated.

## :knife: Slice the data for cross validation :
The training data is divided into two sets. This first is a training set with 70% of the data which is used to train the model. The second is a validation set used to assess model performance.

## :game_die:	Train the model :
The training data-set is used to fit a Random Forest model because it automatically selects important variables and is robust to correlated covariates & outliers in general. 5-fold cross validation is used when applying the algorithm. A Random Forest algorithm is a way of averaging multiple deep decision trees, trained on different parts of the same data-set, with the goal of reducing the variance. This typically produces better performance at the expense of bias and interpret-ability. The Cross-validation technique assesses how the results of a statistical analysis will generalize to an independent data set. In 5-fold cross-validation, the original sample is randomly partitioned into 5 equal sized sub-samples. A single sample is retained for validation and the other sub-samples are used as training data. The process is repeated 5 times and the results from the folds are averaged.

## :dart: Estimate performance :
The model fit using the training data is tested against the validation data. Predicted values for the validation data are then compared to the actual values. This allows forecasting the accuracy and overall out-of-sample error, which indicate how well the model will perform with other data.
