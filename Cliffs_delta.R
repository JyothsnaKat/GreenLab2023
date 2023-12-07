library(dplyr)
library(effsize)

data <- read.csv("D:/Green lab/final.csv")
print(data)

# Transform the energy consumed into domain specific data
Education <- filter(data, Domain_name == "Education")$Energy_consumed
Entertainment <- filter(data, Domain_name == "Entertainment")$Energy_consumed
Gaming <- filter(data, Domain_name == "Gaming")$Energy_consumed


# To see difference between Education and Entertainment
result <- cliff.delta(Education, Entertainment)
print(result)

# To see difference between Entertainment and Gaming
result1 <- cliff.delta(Entertainment, Gaming)
print(result1)

# To see difference between Education and Gaming
result2 <- cliff.delta(Education, Gaming)
print(result2)
