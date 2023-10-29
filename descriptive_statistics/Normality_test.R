library(ggplot2)
library(tibble)
library(dplyr)


# This is the processed data with the domain name, energy consumed, app name(27 records)
data <- read.csv("D:/Green lab/ProcessedReq2.csv")
print(data)


# QQ plot for energy consumption split by domain name
ggplot(dataa, aes(sample=Energy_consumed)) + 
  geom_qq () +
  facet_wrap(~Domain_name)

# Same QQ plot as above but with better captions
ggplot(dataa, aes(sample=Energy_consumed)) + 
  geom_qq(color = "black", size = 1) +
  facet_wrap(~Domain_name) +
  labs(
    title = "Q-Q Plot of Energy Consumption by Domain",
    x = "Theoretical Quantiles",
    y = "Sample Quantiles"
  ) +
  theme_minimal() + 
  theme(
    plot.title = element_text(hjust = 0.5, size=16, face="bold"),
    axis.title.x = element_text(size=14, face="bold"),
    axis.title.y = element_text(size=14, face="bold"),
    strip.text = element_text(size=12, face="bold"),
    axis.text = element_text(size=12)
  )


# Combining all 3 runs for each application into 1
setwd("D:/Green lab/GreenLab2023/Pre-Processed data 1/Blaston")
file_names <- c("run1.csv", "run2.csv", "run3.csv")
data <- do.call(rbind, lapply(file_names, read.csv))


# QQ plot of TP round for each application (You can also use it for each run instead)
ggplot(data, aes(sample=TP_round)) + 
  geom_qq() + 
  labs(title="Q-Q Plot of TP_round", 
       x="Theoretical Quantiles", 
       y="Sample Quantiles")


# This is basically to plot all QQ plots for each application in one frame
# Define the list of application directories
app_directories <- c("Blaston", "Basketball", "Gorillatag","Innerworld","Recroom","ShapesXR","Ultimechs","VRPlayer - tests","Zoe") 

# Initialize an empty list to store data from all apps
all_data <- list()

# Iterate over each directory, read the files, and append the data to the list
for (app_dir in app_directories) {
  setwd(paste0("D:/Green lab/GreenLab2023/Pre-Processed data 1/", app_dir))
  
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


# Shapiro test for normality
# This is shapiro test for energy consumed. 
# Change data and dependent variable accordingly
shapiro_result <- shapiro.test(data$Energy_consumed)$p.value
print(paste("Shapiro-Wilk Test p-value:", shapiro_result))