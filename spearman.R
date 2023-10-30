files <- c("Desktop/Raw data/Pre-Processed data 1/Ultimechs/run1.csv", "Desktop/Raw data/Pre-Processed data 1/Ultimechs/run2.csv", "Desktop/Raw data/Pre-Processed data 1/Ultimechs/run3.csv", "Desktop/Raw data/Pre-Processed data 1/Basketball/run1.csv", "Desktop/Raw data/Pre-Processed data 1/Basketball/run2.csv", "Desktop/Raw data/Pre-Processed data 1/Basketball/run3.csv", "Desktop/Raw data/Pre-Processed data 1/Blaston/run1.csv", "Desktop/Raw data/Pre-Processed data 1/Blaston/run2.csv", "Desktop/Raw data/Pre-Processed data 1/Blaston/run3.csv", "Desktop/Raw data/Pre-Processed data 1/Gorillatag/run1.csv", "Desktop/Raw data/Pre-Processed data 1/Gorillatag/run2.csv", "Desktop/Raw data/Pre-Processed data 1/Gorillatag/run3.csv", "Desktop/Raw data/Pre-Processed data 1/Innerworld/run1.csv", "Desktop/Raw data/Pre-Processed data 1/Innerworld/run2.csv", "Desktop/Raw data/Pre-Processed data 1/Innerworld/run3.csv", "Desktop/Raw data/Pre-Processed data 1/Recroom/run1.csv", "Desktop/Raw data/Pre-Processed data 1/Recroom/run2.csv", "Desktop/Raw data/Pre-Processed data 1/Recroom/run3.csv", "Desktop/Raw data/Pre-Processed data 1/ShapesXR/run1.csv", "Desktop/Raw data/Pre-Processed data 1/ShapesXR/run2.csv", "Desktop/Raw data/Pre-Processed data 1/ShapesXR/run3.csv", "Desktop/Raw data/Pre-Processed data 1/VRPlayer - tests/run1.csv", "Desktop/Raw data/Pre-Processed data 1/VRPlayer - tests/run2.csv", "Desktop/Raw data/Pre-Processed data 1/VRPlayer - tests/run3.csv", "Desktop/Raw data/Pre-Processed data 1/Zoe/run1.csv", "Desktop/Raw data/Pre-Processed data 1/ZOe/run2.csv", "Desktop/Raw data/Pre-Processed data 1/Zoe/run3.csv")

data <- list()
for (file in files) {
  data[[file]] <- read.csv(file)
}


 data<- do.call(rbind, data)
sample_size <- 5000

sampled_data <- data[sample(nrow(data), sample_size)]
variable_names <- c("timewarp_gpu_time_microseconds", "app_pss_MB", "app_vss_MB", "cpu_utilization_percentage", "gpu_utilization_percentage")
titles <- c("Display", "Storage", "Memory", "CPU Utilization", "GPU Utilization")

# Create and store the individual scatter plots with custom titles, Spearman correlation, and r value
 scatter_plots <- lapply(1:length(variable_names), function(i) {
       # Create the scatter plot
         plot <- ggplot(sampled_data, aes(x = TP_round, y = .data[[variable_names[i]]])) +
               geom_point(color = 'blue') +
               labs(title = titles[i]) +
               geom_smooth(method = "spearman", se = FALSE, color = 'red')
           # Calculate the Spearman correlation
           spearman_correlation <- cor(sampled_data$TP_round, sampled_data[[variable_names[i]]], method = "spearman")
     
         # Add the r value as a text label
             plot + annotate("text", x = Inf, y = Inf, label = paste("r =", round(spearman_correlation, 2)), hjust = 1, vjust = 1)
       })

 # Collage the scatter plots together
ggarrange(plotlist = scatter_plots, ncol = 3, nrow = 2)