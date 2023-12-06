import pandas as pd
import scipy.stats as stats

# Static initialization of data
data = {
    'Subject': ['gaming', 'gaming', 'gaming', 'education', 'education', 'education', 'entertainment', 'entertainment', 'entertainment'],
    'Power': [5.58, 5.62, 5.78, 5.53, 5.74, 5.70, 5.4, 4.54, 5.6]
}

# Create a DataFrame
df = pd.DataFrame(data)

# Perform one-way ANOVA
anova_result = stats.f_oneway(
    df['Power'][df['Subject'] == 'gaming'],
    df['Power'][df['Subject'] == 'education'],
    df['Power'][df['Subject'] == 'entertainment']
)

# Print ANOVA results
print(f'ANOVA F-statistic: {anova_result.statistic:.4f}')
print(f'ANOVA p-value: {anova_result.pvalue:.4f}')

# Interpret the results
alpha = 0.05
if anova_result.pvalue < alpha:
    print("Reject the null hypothesis. There are significant differences in power consumption among subjects.")
else:
    print("Fail to reject the null hypothesis. There is no significant difference in power consumption among subjects.")
