library(dplyr)
library(effsize)

data <- read.csv("D:/Green lab/EnergyConsumed.csv")
print(data)

# Transform the energy consumed into domain specific data
domain1_data <- filter(data, Domain_name == "Education")$Energy_consumed
domain2_data <- filter(data, Domain_name == "Entertainment")$Energy_consumed
domain3_data <- filter(data, Domain_name == "Gaming")$Energy_consumed


# To see difference between Education and Entertainment
result <- cliff.delta(domain1_data, domain2_data)
print(result)

# To see difference between Entertainment and Gaming
result1 <- cliff.delta(domain2_data, domain3_data)
print(result1)

# To see difference between Education and Gaming
result2 <- cliff.delta(domain1_data, domain3_data)
print(result2)
