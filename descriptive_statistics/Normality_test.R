library(ggplot2)
library(tibble)
library(dplyr)




# This is basically to plot all QQ plots for each application in one frame
# Define the list of application directories
app_directories <- c("Blaston", "Basketball", "Gorillatag","Innerworld","Recroom","ShapesXR","Ultimechs","VRPlayer - tests","Zoe") 

# Initialize an empty list to store data from all apps
all_data <- list()

# Iterate over each directory, read the files, and append the data to the list
for (app_dir in app_directories) {
  setwd(paste0("D:/Green lab/GreenLab2023/Pre-Processed New data 1/", app_dir))
  
  file_names <- c("run1.csv", "run2.csv", "run3.csv")
  app_data <- do.call(rbind, lapply(file_names, read.csv))
  
  # Add a column to identify the application
  app_data$Application <- app_dir
  
  all_data[[app_dir]] <- app_data
}

# Combine all the application data into a single dataframe
combined_data <- do.call(rbind, all_data)

# Plot the Q-Q plot for all applications in one plot
ggplot(combined_data, aes(sample=TP_round)) + 
  geom_qq() + 
  facet_wrap(~ Application, ncol = 3) +  
  labs(title="Q-Q Plot of Total power across Applications", 
       x="Theoretical Quantiles", 
       y="Sample Quantiles") +
  theme_minimal()

# Plot the Q-Q plot for all applications in one plot
ggplot(combined_data, aes(sample=EC)) + 
  geom_qq() + 
  facet_wrap(~ Application, ncol = 3) +  
  labs(title="Q-Q Plot of Energy consumed across Applications", 
       x="Theoretical Quantiles", 
       y="Sample Quantiles") +
  theme_minimal()

data <- read.csv("D:/MS VU/Green lab/GreenLab2023/Pre-Processed new data 1/Zoe/run3.csv")

# Shapiro test for normality
# This is shapiro test for energy consumed. 
# Change data and dependent variable accordingly
shapiro_result <- shapiro.test(data$EC)$p.value
print(paste("Shapiro-Wilk Test p-value:", shapiro_result))
