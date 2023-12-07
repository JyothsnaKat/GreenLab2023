# GreenLab2023

## Raw Data
The raw data for all the applications can be found in the "Raw Data" folder. Within this folder, you can access data for each application and each run. 

## Data Preprocessing
We utilized the "preprocess.py" script to process the raw data and calculate the total power consumption for each record. The output of this script can be found in the "Pre-Processed Data 1" folder. This pre-processed data is a critical step in preparing the data for further analysis.

## Descriptive Statistics
For a comprehensive understanding of each domain, we offer descriptive statistics. The "des_statistics.R" script, located in the "descriptive_statistics" folder, is used to generate these statistics. 

## Combined records
We have combined all the records from all runs and applications and saved it in the file CombinedRecords.csv. In this file we have also appended for each record a field called Domain and application which refers to the domain name and application name the record belongs to.

## Normality Testing
To ensure the robustness of our analysis, we have employed the "normality_test" script. This script checks for normality in energy consumption and total power across different applications. It includes scripts for generating QQ plots and performing the Shapiro-Wilk test. This step helps validate the assumptions required for some statistical tests.

## Hypothesis Testing
To test our first hypothesis, we've utilized the Spearman correlation matrix. The relevant code can be found in the "spearman.R" script. This analysis assesses relationships between variables within our data.

For the second hypothesis, we've employed the Kruskal-Wallis test, which can be accessed in the "hypothesis_test.R" script. This test assesses whether there are significant differences between domains and applications.

## Delta Estimates
To further understand the differences between pairs of domains, we've created the "Cliffs_delta" script. This script calculates delta estimates, offering valuable insights into the distinctions between domain pairs.




