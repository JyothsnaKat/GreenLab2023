import matplotlib.pyplot as plt
import pandas as pd

# Assuming you have your descriptive statistics in a DataFrame
# Replace the following DataFrame with your actual data
data = {
    'Current_gaming': [1.5, 1.5, 1.5],  # Replace with your gaming data
    'Voltage_gaming': [4.08, 4.21, 4.23],  # Replace with your gaming data
    'Power_gaming': [5.58, 5.62, 5.78],    # Replace with your gaming data
    'Current_education': [1.5, 1.5, 1.5],  # Replace with your education data
    'Voltage_education': [4.21, 4.24, 4.24],  # Replace with your education data
    'Power_education': [5.53, 5.74, 5.70],    # Replace with your education data
    'Current_entertainment': [1.5, 1.5, 1.5],  # Replace with your entertainment data
    'Voltage_entertainment': [3.8, 4.2, 4.02],  # Replace with your entertainment data
    'Power_entertainment': [5.4, 4.54, 5.6],    # Replace with your entertainment data
}

df = pd.DataFrame(data)

# Box plots for gaming


plt.subplot(3, 1, 1)
plt.title('Gaming')
plt.boxplot([df['Power_gaming']], labels=['Gaming'])
plt.ylabel('Power')

# Box plots for education


plt.subplot(3, 1, 2)
plt.title('Education')
plt.boxplot([df['Power_education']], labels=['Education'])
plt.ylabel('Power')

# Box plots for entertainment


plt.subplot(3, 1, 3)
plt.title('Entertainment')
plt.boxplot([df['Power_entertainment']], labels=['Entertainment'])
plt.ylabel('Power')


plt.tight_layout()
plt.show()
